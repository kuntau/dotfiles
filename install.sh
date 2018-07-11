#!/usr/bin/env bash

# install dotfiles script

# an array of files to symlinks
dotfiles=( vimrc gitignore gitconfig zshrc ideavimrc tmux.conf )

echo "Checking requirements..."
command -v zsh >/dev/null 2>&1 || { echo >&2 "I require zsh but it's not installed.  Aborting."; exit 1; }
command -v git >/dev/null 2>&1 || { echo >&2 "I require git but it's not installed.  Aborting."; exit 1; }
echo "All requirements met"
echo ""

echo "Continue installation? "
select yn in "Yes" "No"; do
  case $yn in
    Yes ) echo "Ok."; break;;
    No ) exit;;
  esac
done

for i in "${dotfiles[@]}"
do
  echo "Installing $i config files"
  if [ -f ~/.$i ] || [ -h ~/.$i ]; then
    echo "File exists.. The file .$i will be backup to .$i.bak"
    mv ~/.$i ~/.$i.bak
  fi
  ln -s ~/dotfiles/$i ~/.$i
  echo ""
done

echo "Continue installation? "
select yn in "Yes" "No"; do
  case $yn in
    Yes ) echo "Ok.";
      echo "Symlinking neovim to vim"
      if [ -f ~/.nvimrc ] || [ -h ~/.nvimrc ]; then
        echo "File exists.. Skip installing"
      else
        ln -s ~/.vimrc ~/.nvimrc
        ln -s ~/.vim ~/.nvim
      fi
      echo ""
      break;;
    No ) exit;;
  esac
done

# configure oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then
  echo "You already have Oh My Zsh installed."
else
  echo "Cloning Oh My Zsh..."
  $(which git) clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi
echo ""

echo "Installing custom aliases"
if [ -f ~/.oh-my-zsh/custom/aliases.zsh ] || [ -h ~/.oh-my-zsh/custom/aliases.zsh ]; then
  echo "File exists.. Skip installing"
else
  ln -s ~/dotfiles/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
fi
echo ""

# symlinking the theme
echo "Installing kuntau themes..."
if [ -f ~/.oh-my-zsh/themes/kuntau.zsh-theme ] || [ -h ~/.oh-my-zsh/themes/kuntau.zsh-theme ]; then
  echo "Theme already exist.. Skip installing"
else
  ln -s ~/dotfiles/zsh/kuntau.zsh-theme ~/.oh-my-zsh/themes/kuntau.zsh-theme
fi
echo ""

# symlinking ssh config
echo "Installing SSH config..."
if [ -f ~/.ssh/config ] || [ -h ~/.ssh/config ]; then
  echo "SSH config exist.. Skip installing"
else
  ln -s ~/dotfiles/ssh-config ~/.ssh/config
fi
echo ""

# Install tmux plugins manager
echo "Install Tmux Plugins Manager?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm; break;;
    No ) break;;
  esac
done

# append path.. possible duplicate..
echo "Copy your current PATH and adding it to the end of ~/.zshrc for you? "
select yn in "Yes" "No"; do
  case $yn in
    Yes ) export PATH=\$PATH:$PATH >> ~/.zshrc; break;;
    No ) break;;
  esac
done
# export PATH=\$PATH:$PATH >> ~/.zshrc

echo "Time to change your default shell to zsh!"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) sudo chsh -s $(which zsh); break;;
    No ) break;;
  esac
done
# sudo chsh -s $(which zsh)

# /usr/bin/env zsh
# source ~/.zshrc

echo "kuntau dotfiles is now installed."
