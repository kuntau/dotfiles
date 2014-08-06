#!/usr/bin/env bash

# install dotfiles script

# an array of files to symlinks
dotfiles=( vimrc gitignore gitconfig zshrc ideavimrc )
# dotfiles=( 'vimrc' 'gitignore' 'gitconfig' 'zshrc' 'ideavimrc' )

echo "Checking requirements..."
command -v zsh >/dev/null 2>&1 || { echo >&2 "I require zsh but it's not installed.  Aborting."; exit 1; }
command -v git >/dev/null 2>&1 || { echo >&2 "I require zsh but it's not installed.  Aborting."; exit 1; }
echo "All requirements met"
echo ""

for i in "${dotfiles[@]}"
do
  echo "Installing $i config files"
  if [ -f ~/$i ] || [ -h ~/$i ]; then
    echo "File exists.. The file $i will be backup to $i.bak"
    mv $i $i.bak
  fi
  ln -s ~/dotfiles/$i ~/.$i
  echo ""
done

# configure oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then
  echo "You already have Oh My Zsh installed."
else
  echo "Cloning Oh My Zsh..."
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

echo "Installing custom aliases"
ln -s ~/dotfiles/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh

# symlinking the theme
echo "Installing kuntau themes..."
ln -s ~/dotfiles/zsh/kuntau.zsh-theme ~/.oh-my-zsh/themes/kuntau.zsh-theme

# append path.. possible duplicate..
# echo "\033[0;34mCopying your current PATH and adding it to the end of ~/.zshrc for you.\033[0m"
# export PATH=\$PATH:$PATH >> ~/.zshrc

# echo "\033[0;34mTime to change your default shell to zsh!\033[0m"
# sudo chsh -s `which zsh`

echo "\n\nkuntau dotfiles is now installed."
# /usr/bin/env zsh
source ~/.zshrc
