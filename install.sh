#!/usr/bin/env bash

# install dotfiles script

# FUNCTIONS #

function makeSymlink {
  # check if link exist
  # handle os difference
  # if TEST=true just echo result without making change
  if [ "$DEBUG" = true ]; then
    echo "::DEBUG: $OS:: ln -s $1 $2"
  elif [ "$OS" = Darwin ]; then
    # echo "::$OS ln -s $1 $2"
    ln -sv "$1" "$2"
  elif [ "$OS" = Linux ]; then
    # echo "::$OS ln -s $1 $2"
    ln -sv --backup --suffix='.bak' "$1" "$2"
  else
    echo "ELSE FAILED"
  fi

}

# CONFIGS #

DEBUG=false
OS=$(uname)
HOSTNAME=$(hostname)
DOTFILES_HOME=$HOME/dotfiles
THEME_DIR=$DOTFILES_HOME/zsh/themes
XDG_CONFIG_HOME=$HOME/.config
ZPLUG_HOME=$HOME/.zplug
FZF_HOME=$HOME/.fzf
# an array of files to symlinks
CONFIG_FILES=(
  vimrc
  gitignore
  gitconfig
  zshrc
  ideavimrc
  tmux.conf
  tigrc
)

# START INSTALL #

echo "Checking requirements..."
hash zsh 2>/dev/null || { echo >&2 "I require zsh but it's not installed.  Aborting."; exit 1; }
hash git 2>/dev/null || { echo >&2 "I require git but it's not installed.  Aborting."; exit 1; }
echo "All requirements met"
echo ""

echo "Continue installation? "
select yn in "Yes" "No"; do
  case $yn in
    Yes ) echo "Ok."; break;;
    No ) exit;;
  esac
done
echo ""

for i in "${CONFIG_FILES[@]}"
do
  echo "Installing $i config files"
  if [[ -e $HOME/.$i ]]; then
    echo "File exists.. The file .$i will be backup to .$i.bak"
    mv $HOME/.$i $HOME/.$i.bak
  fi
  # ln -s --backup --suffix='.bak' $DOTFILES_HOME/config/$i $HOME/.$i
  makeSymlink "$DOTFILES_HOME/config/$i" "$HOME/.$i"
  echo ""
done

echo "Symlinking Vim to NeoVim next.."
echo "Continue installation? "
select yn in "Yes" "No"; do
  case $yn in
    Yes ) echo "Ok.";
      echo "Symlinking vim to neovim"
      if [[ -e $XDG_CONFIG_HOME/nvim/init.vim ]]; then
        echo "File exists.. Skip installing"
      elif [ ! -d $HOME/.vim ]; then
        echo "Vim config dir not found, setup Vim first? Skipping..."
      else
        # ln -s $HOME/.vim $XDG_CONFIG_HOME/nvim
        # ln -s $HOME/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
        makeSymlink "$HOME/.vim" "$XDG_CONFIG_HOME/nvim"
        makeSymlink "$HOME/.vimrc" "$XDG_CONFIG_HOME/nvim/init.vim"
      fi
      echo ""
      break;;
    No ) exit;;
  esac
done

# Install fzf
if [ -d $FZF_HOME ]; then
  echo "You already have fzf installed, skipping..."
else
  echo "Installing fzf..."
  $(which git) clone --depth=1 https://github.com/junegunn/fzf.git $FZF_HOME
  $FZF_HOME/install
fi
echo ""

# Install zplug
if [ -d $ZPLUG_HOME ]; then
  echo "You already have zplug installed, skipping..."
else
  echo "Installing zplug..."
  $(which git) clone --depth=1 https://github.com/zplug/zplug.git $ZPLUG_HOME
  $ZPLUG_HOME/autoload/zplug install
fi
echo ""

# Install tmux plugins manager
echo "Checking Tmux Plugins Manager status..."
if [[ -d $HOME/.tmux/plugins/tpm  ]]; then
  echo "TPM already installed"
else
  echo "Install Tmux Plugins Manager?"
  select yn in "Yes" "No"; do
    case $yn in
      Yes ) $(which git) clone --depth=1 https://github.com/tmux-plugins/tpm.git $HOME/.tmux/plugins/tpm; break;;
      No ) break;;
    esac
  done
fi
echo ""

# symlinking ssh config
echo "Installing SSH config..."
if [[ -e $HOME/.ssh/config ]]; then
  echo "SSH config exist.. Skip installing"
else
  [[ ! -d $HOME/.ssh ]] && mkdir -p $HOME/.ssh
  # ln -s $DOTFILES_HOME/ssh-config $HOME/.ssh/config
  makeSymlink "$DOTFILES_HOME/config/ssh-config" "$HOME/.ssh/config"
fi
echo ""

# check .secret fiel availability
echo "Checking .secret file..."
if [[ -e $HOME/.secret ]]; then
  echo ".secret file exist.. Skip installing"
else
  touch $HOME/.secret
fi
echo ""

# append path.. possible duplicate..
echo "Copy your current PATH and adding it to the end of ~/.zshrc for you? "
select yn in "Yes" "No"; do
  case $yn in
    Yes ) export PATH=\$PATH:$PATH >> $HOME/.zshrc; break;;
    No ) break;;
  esac
done
echo ""

echo "Time to change your default shell to zsh!"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) chsh -s $(which zsh); break;;
    No ) break;;
  esac
done
echo ""

# PS3="Select p10k theme: "
echo "Select p10k theme"
select opt in basic powerline nerdfont; do
  case $opt in
    basic)
      # ln -s --backup --suffix='.bak' $THEME_DIR/p10k.basic.zsh $HOME/.p10k.zsh;
      makeSymlink "$THEME_DIR/p10k.basic.zsh" "$HOME/.p10k.zsh"
      break;;
    powerline)
      # ln -s --backup --suffix='.bak' $THEME_DIR/p10k.powerline.zsh $HOME/.p10k.zsh;
      makeSymlink "$THEME_DIR/p10k.powerline.zsh" "$HOME/.p10k.zsh"
      break;;
    nerdfont)
      # ln -s --backup --suffix='.bak' $THEME_DIR/p10k.nerdfont.zsh $HOME/.p10k.zsh;
      makeSymlink "$THEME_DIR/p10k.nerdfont.zsh" "$HOME/.p10k.zsh"
      break;;
    skip)
      echo "Skip linking p10k theme"
      break;;
    *)
      echo "Invalid option $REPLY"
      ;;
  esac
done
echo ""

# source ~/.zshrc
# $EDITOR +PlugInstall

hash node 2>/dev/null || { echo "No NodeJS installation detected. Alternative https://github.com/nodesource/distributions/blob/master/README.md"; }
hash nginx 2>/dev/null || { echo "No nginx installation detected. "; }

echo "kuntau dotfiles is now installed."

