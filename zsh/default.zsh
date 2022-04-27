export PAGER='less -S'
hash bat 2> /dev/null && export PAGER='bat -p' && export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export VISUAL='vim'
export EDITOR='vim'
hash nvim 2> /dev/null && export EDITOR='nvim' && export VISUAL='nvim'
