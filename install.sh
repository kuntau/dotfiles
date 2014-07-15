# install dotfiles script

# an array of files to symlinks
dotfiles=( vimrc gitignore gitconfig zshrc ideavimrc )

for i in "${dotfiles[@]}"
do
  echo $1
done

# configure vim
echo "Installing & backup existing vimrc..."
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]
then
  mv ~/.vimrc ~/.vimrc-prekuntau
fi

ln -s ~/dotfiles/vimrc ~/.vimrc

#configure gitignore
echo "\033[0;33mInstalling gitignore..."
if [ -f ~/.gitignore ] || [ -h ~/.gitignore ]
then
  mv ~/.gitignore ~/.gitignore-prekuntau
fi

ln -s ~/dotfiles/gitignore ~/.gitignore

#configure gitconfig
echo "\033[0;33mInstalling gitconfig..."
if [ -f ~/.gitconfig ] || [ -h ~/.gitconfig ]
then
  mv ~/.gitconfig ~/.gitconfig-prekuntau
fi

ln -s ~/dotfiles/gitconfig ~/.gitconfig

#configure oh-my-zsh
if [ -d ~/.oh-my-zsh ]
then
  echo "\033[0;33mYou already have Oh My Zsh installed."
else
  echo "\033[0;34mCloning Oh My Zsh...\033[0m"
  hash git >/dev/null && /usr/bin/env git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh || {
    echo "git not installed"
    exit
  }
fi

#install our zsh config and backup the old one if existed
echo "\033[0;34mLooking for an existing zsh config...\033[0m"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]
then
  echo "\033[0;33mFound ~/.zshrc.\033[0m \033[0;32mBacking up to ~/.zshrc.pre-oh-my-zsh\033[0m";
  mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
fi

echo "\033[0;34mUsing my zshrc and adding it to ~/.zshrc\033[0m"
ln -s ~/dotfiles/zshrc ~/.zshrc

echo "\033[0;34mInstalling custom aliases\033[0m"
ln -s ~/dotfiles/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh

#symlinking our theme
echo "\033[0;34mInstalling doubleend themes...\033[0m"
ln -s ~/dotfiles/zsh/doubleend.zsh-theme ~/.oh-my-zsh/themes/doubleend.zsh-theme

#append path.. possible duplicate..
echo "\033[0;34mCopying your current PATH and adding it to the end of ~/.zshrc for you.\033[0m"
echo "export PATH=\$PATH:$PATH" >> ~/.zshrc

echo "\033[0;34mTime to change your default shell to zsh!\033[0m"
sudo chsh -s `which zsh`

echo "\n\n \033[0;32mkuntau dotfiles is now installed.\033[0m"
/usr/bin/env zsh
source ~/.zshrc
