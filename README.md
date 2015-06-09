Kuntau's dotfiles
========

[![build status](https://img.shields.io/travis/kuntau/dotfiles.svg?style=flat-square)](https://travis-ci.org/kuntau/dotfiles)

Installation:
-------------

`git clone git://github.com/kuntau/dotfiles.git ~/dotfiles`

### Make the install script executable

```bash
cd ~/dotfiles
chmox +x install.sh
./install.sh
```

Switch to the __~/dotfiles__ directory, and fetch submodules:

```bash
cd ~/dotfiles
git submodule update --init --recursive

# For git 1.6.1 or above you can use something similar to easy pull all submodule:
git submodule foreach git pull
```
### Install `vim`/`neovim` package manager

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
