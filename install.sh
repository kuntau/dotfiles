#configure vim
echo "\033[0;33mInstalling vimrc..."
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]
then
  mv ~/.vimrc ~/.vimrc-old
fi

ln -s ~/dotfiles/vimrc ~/.vimrc

#configure gitignore
echo "\033[0;33mInstalling gitignore..."
if [ -f ~/.gitignore ] || [ -h ~/.gitignore ]
then
  mv ~/.gitignore ~/.gitignore-old
fi

ln -s ~/dotfiles/gitignore ~/.gitignore

#configure gitconfig
echo "\033[0;33mInstalling gitconfig..."
if [ -f ~/.gitconfig ] || [ -h ~/.gitconfig ]
then
  mv ~/.gitconfig ~/.gitconfig-old
fi

ln -s ~/dotfiles/gitconfig ~/.gitconfig

#configure oh-my-zsh
if [ -d ~/.oh-my-zsh ]
then
  echo "\033[0;33mYou already have Oh My Zsh installed.\033[0m You'll need to remove ~/.oh-my-zsh if you want to install"
  exit
fi

echo "\033[0;34mCloning Oh My Zsh...\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh || {
  echo "git not installed"
  exit
}

echo "\033[0;34mLooking for an existing zsh config...\033[0m"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]
then
  echo "\033[0;33mFound ~/.zshrc.\033[0m \033[0;32mBacking up to ~/.zshrc.pre-oh-my-zsh\033[0m";
  mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
fi

echo "\033[0;34mUsing my zshrc and adding it to ~/.zshrc\033[0m"
ln -s ~/dotfiles/zshrc ~/.zshrc

echo "\033[0;34mInstalling doubleend themes...\033[0m"
ln -s ~/dotfiles/zsh/doubleend.zsh-theme ~/.oh-my-zsh/themes/doubleend.zsh-theme

echo "\033[0;34mCopying your current PATH and adding it to the end of ~/.zshrc for you.\033[0m"
echo "export PATH=\$PATH:$PATH" >> ~/.zshrc

echo "\033[0;34mTime to change your default shell to zsh!\033[0m"
sudo chsh -s `which zsh`

echo "\n\n \033[0;32mkuntau dotfiles is now installed.\033[0m"
/usr/bin/env zsh
source ~/.zshrc
