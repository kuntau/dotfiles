dotfiles
========

my personal dotfiles

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
### Install vim dependecies

`$ git clone https://github.ocm/gmarik/Vundle.vim ~/.vim/bundl`
or
`vundle-init` if we got homebrew's plugin activated
