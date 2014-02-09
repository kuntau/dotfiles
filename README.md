dotfiles
========

my personal dotfiles

Installation:
=============

git clone git://github.com/kuntau/vim.git ~/vim

Create symlinks:

`ln -s ~/vim ~/.vim`
`ln -s ~/.vim/vimrc ~/.vimrc`

Windows Vista and above:

mklink /j "c:\users\<usernamae>\_gvimrc" "d:\<username>\vim\vimrc"

Switch to the ~/vim directory, and fetch submodules:

```
cd ~/vim
git submodule update --init --recursive
```

For git 1.6.1 or above you can use something similar to easy pull all submodule:

`git submodule foreach git pull`

