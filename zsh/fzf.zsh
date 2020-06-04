# REFERENCE https://github.com/junegunn/fzf/issues/745

export FZF_TMUX=0
export FZF_TMUX_HEIGHT=40%
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_COLOR_MIRAGE='--color=fg:#cbccc6,bg:#1f2430,hl:#707a8c --color=fg+:#707a8c,bg+:#191e2a,hl+:#ffcc66 --color=info:#73d0ff,prompt:#707a8c,pointer:#cbccc6 --color=marker:#73d0ff,spinner:#73d0ff,header:#d4bfff'
export FZF_PREVIEW_OPTS="(bat --style plain --wrap never --color always {} || cat {} || tree -C {}) 2> /dev/null | head -200"
export FZF_PREVIEW_WINDOW_RIGHT="--preview-window wrap --bind '?:toggle-preview'"
export FZF_PREVIEW_WINDOW_DOWN="--preview-window down:wrap --bind '?:toggle-preview'"
export FZF_PREVIEW_WINDOW_HIDDEN="--preview-window hidden:wrap --bind '?:toggle-preview'"
export FZF_DEFAULT_OPTS="--extended --reverse --inline-info $FZF_COLOR_MIRAGE"
export FZF_CTRL_R_OPTS="--preview 'echo {}' $FZF_PREVIEW_WINDOW_DOWN"
# export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(bat {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '$FZF_PREVIEW_OPTS' $FZF_PREVIEW_WINDOW_RIGHT"
export FZF_ALT_C_OPTS="--preview '$FZF_PREVIEW_OPTS'"
# export FZF_ALT_C_OPTS="--preview '($FZF_PREVIEW_OPTS) 2> /dev/null | head -200'"

# export FZF_DEFAULT_OPTS="--color light,bg+:153,fg+:-1,pointer:-1,prompt:-1,hl:125,hl+:125,info:-1,spinner:-1 --tabstop=4 --layout=reverse --info=hidden --no-bold"

human_path() {
  sed "s#^$HOME#~#g"
}

expand_tilde() {
  sed "s#^~#$HOME#g"
}

relative_path() {
  sed "s#$PWD/##g"
}

quick_paths() {
  fd -aH -d4 .
  fd -H -d2 . ~/coding
  fd -H . ~/dotfiles
}

append_history() {
  "$@"
  print -s -- "$*"
}

# FZF + GIT helper {{{
# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-r:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# show commit from log
git-commit-show ()
{
  git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"  | \
   fzf --ansi --no-sort --reverse --tiebreak=index --preview \
   'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always $1 ; }; f {}' \
   --bind "alt-j:preview-down,alt-k:preview-up,ctrl-d:preview-page-down,ctrl-u:preview-page-up,ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF" --preview-window=right:60%
}
# --bind "alt-j:preview-down,alt-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,q:abort,ctrl-m:execute:
# }}}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fe() (
  IFS=$'\n' out=("$(fzf --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
)

fzf_quick_paths() {
  local word="${LBUFFER##* }"

  local selected
  selected="$(quick_paths | relative_path | human_path | awk '!seen[$0]++' | fzf --no-sort --height=40% --query="$word" | expand_tilde)"
  if [[ "$selected" ]]; then
    if [[ ! "$BUFFER" ]]; then
      if [[ -d "$selected" ]]; then
        append_history cd "$selected"
      elif [[ -e "$selected" ]]; then
        append_history $EDITOR "$selected"
      fi
    else
      LBUFFER="${LBUFFER%$word}${selected}"
    fi
  fi
  zle reset-prompt
}
zle -N fzf-quick-paths fzf_quick_paths
bindkey "\ev" fzf-quick-paths

fzf_history() {
  local selected
  IFS=$'\n' selected=($(fc -lnr 1 | fzf --expect=ctrl-v --no-sort --height=40% --query="$BUFFER"))
  if [[ "$selected" ]]; then
    LBUFFER="$selected"
    if [[ ${#selected[@]} -eq 2 ]]; then
      LBUFFER="${selected[2]}"
      zle accept-line
    fi
  fi
  zle reset-prompt
}
zle -N fzf-history fzf_history
bindkey "^X^E" fzf-history

fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

# CTRL-R - Execute or edit from history
fzf-history-widget-ext() {
  local selected num key
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(fc -rl 1 | perl -ne 'print if !$seen{(/^\s*[0-9]+\s+(.*)/, $1)}++' |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,..
                      --tiebreak=index
                      --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS
                      --expect=ctrl-x,ctrl-e
                      --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
  local ret=$?
  if [ -n "$selected" ]; then
    # if there is expect option, first array always the pressed key, none if enter pressed
    key=$selected[1]
    num=$selected[2]
    if [ "$key" = ctrl-e ]; then
      zle vi-fetch-history -n $num
      zle accept-line
    elif [ "$key" = ctrl-x ]; then
      zle vi-fetch-history -n $num
    elif [ -n "$key" ]; then
      zle vi-fetch-history -n $key
    fi
  fi
  zle reset-prompt
  return $ret
}
zle     -N   fzf-history-widget-ext
bindkey '^R' fzf-history-widget-ext
