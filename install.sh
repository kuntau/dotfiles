#!/usr/bin/env bash

# install dotfiles script

# an array of files to symlinks
dotfiles=( vimrc gitignore gitconfig zshrc ideavimrc )

echo "Checking requirements..."
command -v zsh >/dev/null 2>&1 || { echo >&2 "I require zsh but it's not installed.  Aborting."; exit 1; }
command -v git >/dev/null 2>&1 || { echo >&2 "I require zsh but it's not installed.  Aborting."; exit 1; }
echo "All requirements met"
echo ""

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
  echo "File exists.. Skip installing"
else
  ln -s ~/dotfiles/zsh/kuntau.zsh-theme ~/.oh-my-zsh/themes/kuntau.zsh-theme
fi
echo ""

# append path.. possible duplicate..
# echo "Copying your current PATH and adding it to the end of ~/.zshrc for you."
# export PATH=\$PATH:$PATH >> ~/.zshrc

# echo "Time to change your default shell to zsh!"
# sudo chsh -s $(which zsh)

echo "kuntau dotfiles is now installed."
# /usr/bin/env zsh
# source ~/.zshrc
