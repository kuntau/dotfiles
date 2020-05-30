#!/usr/bin/env bash

# install dotfiles script

DOTFILES_HOME=$HOME/dotfiles
XDG_CONFIG_HOME=$HOME/.config
ZPLUG_HOME=$HOME/.zplug
# an array of files to symlinks
CONFIG_FILES=(
  vimrc
  gitignore
  gitconfig
  zshrc
  ideavimrc
  tmux.conf
)

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

for i in "${CONFIG_FILES[@]}"
do
  echo "Installing $i config files"
  if [[ -e $HOME/.$i ]]; then
    echo "File exists.. The file .$i will be backup to .$i.bak"
    mv $HOME/.$i $HOME/.$i.bak
  fi
  ln -s $DOTFILES_HOME/$i $HOME/.$i
  echo ""
done

echo "Continue installation? "
select yn in "Yes" "No"; do
  case $yn in
    Yes ) echo "Ok.";
      echo "Symlinking vim to neovim"
      if [[ -e $XDG_CONFIG_HOME/nvim/init.vim ]]; then
        echo "File exists.. Skip installing"
      else
        ln -s $HOME/.vim $HOME/.nvim
        ln -s $HOME/.vimrc $HOME/.nvimrc
      fi
      echo ""
      break;;
    No ) exit;;
  esac
done

# symlinking ssh config
echo "Installing SSH config..."
if [ -f $HOME/.ssh/config ] || [ -h $HOME/.ssh/config ]; then
  echo "SSH config exist.. Skip installing"
else
  ln -s $DOTFILES_HOME/ssh-config $HOME/.ssh/config
fi
echo ""

# Install zplug
if [ -d $HOME/.zplug ]; then
  echo "You already have zplug installed, skipping..."
else
  echo "Installing zplug..."
  $(which git) clone https://github.com/zplug/zplug.git $ZPLUG_HOME
fi
echo ""

# Install tmux plugins manager
echo "Install Tmux Plugins Manager?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) git clone https://github.com/tmux-plugins/tpm.git $HOME/.tmux/plugins/tpm; break;;
    No ) break;;
  esac
done

# append path.. possible duplicate..
echo "Copy your current PATH and adding it to the end of ~/.zshrc for you? "
select yn in "Yes" "No"; do
  case $yn in
    Yes ) export PATH=\$PATH:$PATH >> $HOME/.zshrc; break;;
    No ) break;;
  esac
done
# export PATH=\$PATH:$PATH >> ~/.zshrc

echo "Time to change your default shell to zsh!"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) chsh -s $(which zsh); break;;
    No ) break;;
  esac
done

# /usr/bin/env zsh
# source ~/.zshrc

echo "kuntau dotfiles is now installed."
