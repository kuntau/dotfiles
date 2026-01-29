export PAGER='less -S'
export EDITOR='vim'
export VISUAL='vim'
export HOMEBREW_EDITOR='vim'

exists bat && \
  export PAGER='bat' && \
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"

exists nvim && \
  export EDITOR='nvim' && \
  export VISUAL='nvim' && \
  export HOMEBREW_EDITOR='nvim' && \
  export MANPAGER='nvim +Man!'

# Default Markdown viewer
export MARKDOWN_VIEWER=$(exists glow && echo 'glow' || echo $PAGER)

# Default grep. TODO: Rewrite this
if exists rg; then
  GREP=rg
elif exists ag; then
  GREP=ag
else
  GREP=grep
fi

