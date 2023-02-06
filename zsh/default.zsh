export PAGER='less -S'
exists bat && export PAGER='bat -p' && export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export VISUAL='vim'
export EDITOR='vim'
exists nvim && export EDITOR='nvim' && export VISUAL='nvim' && export MANPAGER='nvim +Man!'
