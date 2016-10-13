Kuntau's dotfiles
========

[![build status](https://img.shields.io/travis/kuntau/dotfiles.svg?style=flat-square)](https://travis-ci.org/kuntau/dotfiles)

Installation:
-------------

`git clone git://github.com/kuntau/dotfiles.git ~/dotfiles`

### Make the install script executable

```zsh
cd ~/dotfiles
chmox a+x install.sh
./install.sh
```

Switch to the __~/dotfiles__ directory, and fetch submodules:

```zsh
cd ~/dotfiles
git submodule update --init --recursive

# For git 1.6.1 or above you can use something similar to easy pull all submodule:
git submodule foreach git pull
```
### Install `vim`/`neovim` package manager

```zsh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
### P/S. It is hard & PITA to maintain the same dotfiles accross `OS X`, `Linux` & `Windows (Cygwin)`
