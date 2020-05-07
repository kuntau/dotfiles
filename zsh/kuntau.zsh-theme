# vim:ft=zsh ts=2 sw=2 sts=2

local ret_status="%(?:%{$fg_bold[green]%} ❯ :%{$fg_bold[red]%}➜ %s)"
PROMPT='
%{$fg_bold[cyan]%}%n@%m %{$fg[yellow]%}%~
${ret_status}'

# local ret_code="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
# local user='%{$fg_bold[cyan]%}%n@%m%{$reset_color%}'
# local pwd='%{$fg_bold[yellow]%}%~%{$reset_color%}'
# PROMPT='${user} ${pwd} $(ret_code) %{$reset_color%}'
#
# local git_branch='%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
RPROMPT='%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%}'
#
# # ❯ | ➜
#
# ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✗ %{$fg[red]%})%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%}+"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}+"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}+"

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
