# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kuntau"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

ZSH_TMUX_AUTOQUIT="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras git-flow node npm coffee bower brew-cask zsh-syntax-highlighting colorize tmux heroku laravel5)

# Customize to your needs...
# export PATH=$PATH:{{/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/go/bin:/home/kuntau/go/bin:/bin/feedingbottle/:/opt/lampp/bin/:/home/kuntau/.rvm/bin}:/home/kuntau/android-sdk/tools}:/home/kuntau/android-sdk/platform-tools

# My aliases

osname=$(uname)

if [[ $osname == Linux ]]; then
  # GOROOT='/usr/lib/go'
  # PATH=$PATH
  export PATH=~/npm/bin:/usr/local/go/bin:$PATH
  # export NODE_PATH=$NODE_PATH:/home/kuntau/npm/lib/node_modules
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
elif [[ $osname == Darwin ]]; then
  # set android dev path
  export ANDROID_HOME=~/Library/Android/sdk
  # [ -f ~/.iterm2_shell_integration.zsh ] && source ~/.iterm2_shell_integration.zsh
  # [ -x fzf ] && export FZF_DEFAULT_OPTS="-x"
  [ -x rustup ] && source $HOME/.cargo/env
  # export GOROOT='/usr/local/Cellar/go/1.1.2'
  # RUBYROOT='/usr/local/Cellar/ruby/2.1.1_1'
  # GEMPATH='~/.gem/ruby/2.1.0'
  # export PATH=$PATH:$RUBYROOT/bin:$GEMPATH
  # source $(brew --prefix nvm)/nvm.sh
  # brew cask flags
  export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
  # export final osx path
  export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:~/Library/Python/2.7/bin:~/.npm/bin:${ANDROID_HOME}/tools:$PATH
elif [[ $osname == CYGWIN_NT-6.1 ]]; then
  export PATH=/usr/local/bin:/usr/bin:/cygdrive/c/"Program Files (x86)/NVIDIA Corporation"/PhysX/Common:/cygdrive/c/Windows/system32:/cygdrive/c/Windows:/cygdrive/c/Windows/System32/Wbem:/cygdrive/c/Windows/System32/WindowsPowerShell/v1.0:/cygdrive/c/"Program Files/Intel/DMIX":$PATH
  source ~/dotfiles/mintty/sol.dark
fi

# make vim the default editor!
if command -v nvim &>/dev/null; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi

# add composer vender bin to PATH only if composer exist
if command -v composer &>/dev/null; then
  export PATH=$PATH:$HOME/.composer/vendor/bin
fi

alias 'rld=source ~/.zshrc'
alias 'reloadaliases=source ~/dotfiles/zsh/aliases.zsh'

# make default term
export TERM="xterm-256color"

# make our custom scripts work!
export PATH=$PATH:~/dotfiles/bin

# fix locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Timing.app Terminal Support
PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "
# export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

# Remove duplicate in PATH
typeset -U PATH

# FZF -- https://github.com/junegunn/fzf
if [ -f ~/.fzf.zsh ]; then
  export FZF_DEFAULT_OPTS="-x"
  export FZF_DEFAULT_COMMAND="ag -l -g ''"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/openssl/bin:$PATH"

# FIX the blinding green on green directory listing on external drive.
# Read more https://unix.stackexchange.com/questions/94498/what-causes-this-green-background-in-ls-output
if [[ -f ~/.dircolors ]]; then
  eval $(dircolors -b ~/.dircolors)
elif [[ -f /etc/DIR_COLORS ]]; then
  eval $(dircolors -b /etc/DIR_COLORS)
fi

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
