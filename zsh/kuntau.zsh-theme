local user='%{$fg[cyan]%}%n%B@%b%{$fg[cyan]%}%m%{$reset_color%}'
local pwd='%{$fg[yellow]%}%~%{$reset_color%}'
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(parse_git_dirty)$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%U"
ZSH_THEME_GIT_PROMPT_SUFFIX="%u%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} +"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%}+"
# ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
# ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}+"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}+"

PROMPT="
${user} ${pwd}
❯ "
RPROMPT="${return_code} ${git_branch}"
