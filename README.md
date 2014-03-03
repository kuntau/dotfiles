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

Todo
----

### Symlinks on install
- [x] Symlink zsh theme
- [x] Symlink zshrc
- [x] Symlink vimrc
- [x] Symlink .gitignore
- [ ] Symlink .vintageousrc file
- [ ] Symlink Sublime Text 3 preferences
- [ ] Symlink Sublime Text 3 Shortcut