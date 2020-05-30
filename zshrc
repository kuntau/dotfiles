# vim: foldmethod=marker foldlevel=0 nomodeline:

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# start zplug {{{
source ~/.zplug/init.zsh

# from oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/git-flow", from:oh-my-zsh
zplug "plugins/node", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh

# from github
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/enhancd", use:init.sh
zplug "rupa/z", use:z.sh
# zplug "rupa/v", use:v
# zplug "clvv/fasd", use:fasd

# theme
zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme

if ! zplug check; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load
# }}}

# Set ENV VARIABLE {{{
OS_NAME=$(uname)
DOTFILES_HOME=$HOME/dotfiles

if [[ $OS_NAME == Linux ]]; then
  # export PATH=~/npm/bin:/usr/local/go/bin:$PATH
  # export PATH=~/.local/bin:$PATH
elif [[ $OS_NAME == Darwin ]]; then
  # set android dev path
  export ANDROID_HOME=~/Library/Android/sdk

  # rust
  # golang
  # export GOROOT='/usr/local/Cellar/go/1.1.2'

  # Ruby
  # RUBYROOT='/usr/local/Cellar/ruby/2.1.1_1'
  # USE RUBY GEM AS USER --user-install
  GEM_HOME=$HOME/.gem/ruby/2.6.0/
  export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
  # GEMPATH='~/.gem/ruby/2.1.0'
  # export PATH=$PATH:$RUBYROOT/bin:$GEMPATH

  # Homebrew
  export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
elif [[ $OS_NAME == CYGWIN_NT-6.1 ]]; then
  export PATH=/usr/local/bin:/usr/bin:/cygdrive/c/"Program Files (x86)/NVIDIA Corporation"/PhysX/Common:/cygdrive/c/Windows/system32:/cygdrive/c/Windows:/cygdrive/c/Windows/System32/Wbem:/cygdrive/c/Windows/System32/WindowsPowerShell/v1.0:/cygdrive/c/"Program Files/Intel/DMIX":$PATH
  source ~/dotfiles/mintty/sol.dark
fi

# Fix locale
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Plugins config & ENV {{{
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#707a8c,bg=#1f2430"   # fg=#ff00ff,bg=cyan,bold,underline"

# zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# bat theme
export BAT_THEME="Monokai Extended"

# https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
if [ -f ~/.fzf.zsh ]; then
  export FZF_TMUX=0
  export FZF_TMUX_HEIGHT=40%
  export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

  export FZF_COLOR_MIRAGE='--color=fg:#cbccc6,bg:#1f2430,hl:#707a8c --color=fg+:#707a8c,bg+:#191e2a,hl+:#ffcc66 --color=info:#73d0ff,prompt:#707a8c,pointer:#cbccc6 --color=marker:#73d0ff,spinner:#73d0ff,header:#d4bfff'
  export FZF_DEFAULT_OPTS="--extended --reverse --inline-info $FZF_COLOR_MIRAGE"
  export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
  export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(bat {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
  export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

  fzf-history-widget-accept() {
    fzf-history-widget
    zle accept-line
  }
  zle     -N     fzf-history-widget-accept
  bindkey '^X^R' fzf-history-widget-accept
fi

# FIX the blinding green on green directory listing on external drive.
# Read more https://unix.stackexchange.com/questions/94498/what-causes-this-green-background-in-ls-output
if [[ -f ~/.dircolors ]]; then
  eval $(dircolors -b ~/.dircolors)
elif [[ -f /etc/DIR_COLORS ]]; then
  eval $(dircolors -b /etc/DIR_COLORS)
fi
# }}}

# }}}

# Update $PATH {{{
hash npm   2>/dev/null && export NPM_CONFIG_PREFIX=$HOME/.npm-global # npm -g install location
hash npm   2>/dev/null && export PATH=$PATH:$HOME/.npm-global/bin    # npm global binary path
hash pip   2>/dev/null && export PATH=$PATH:$HOME/.local/bin         # pip app binary path
hash cargo 2>/dev/null && export PATH=$PATH:$HOME/.cargo/bin         # rust cargo binary path
hash snap  2>/dev/null && export PATH=$PATH:/snap/bin                # snap binary path
export PATH=$DOTFILES_HOME/bin:$PATH
# }}}

# Extra sources {{{
source ~/dotfiles/zsh/aliases.zsh # my aliases
source ~/.secret                  # don't commit this file

[[ -x rustup ]] && source $HOME/.cargo/env
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
# }}}
