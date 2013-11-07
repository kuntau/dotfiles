# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="doubleend"

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
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git node npm coffee vundle brew bower sublime extract zsh-syntax-highlighting yeoman)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# export PATH=$PATH:{{/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/go/bin:/home/kuntau/go/bin:/bin/feedingbottle/:/opt/lampp/bin/:/home/kuntau/.rvm/bin}:/home/kuntau/android-sdk/tools}:/home/kuntau/android-sdk/platform-tools

# My aliases

# export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH

osname=$(uname)

if [[ osname == Linux ]]; then
  GOROOT='/usr/lib/go'
  export PATH=$PATH
  # echo $uname
elif [[ osname == darwin ]]; then
  export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH
  export GOROOT='/usr/local/Cellar/go/1.1.2'
  RUBYROOT='usr/local/Cellar/ruby/2.0.0-p247'
  export PATH=$PATH:$RUBYROOT/bin:$GOROOT/bin
fi

export EDITOR=vim
alias 'rld=source ~/.zshrc'
