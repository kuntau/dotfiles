export PAGER='less -S'
exists bat && export PAGER='bat' && export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export VISUAL='vim'
export EDITOR='vim'
exists nvim && export EDITOR='nvim' && export VISUAL='nvim' && export MANPAGER='nvim +Man!'

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

