# Kuntau's dotfiles

[![build status](https://img.shields.io/travis/kuntau/dotfiles.svg?style=flat-square)](https://travis-ci.org/kuntau/dotfiles)

## Installation

`git clone git://github.com/kuntau/dotfiles.git ~/dotfiles`

### Make the install script executable

```zsh
cd ~/dotfiles
chmod a+x install.sh
./install.sh
```

Change to the `~/dotfiles` directory, and ***fetch*** submodules:

```zsh
cd ~/dotfiles
git submodule update --init --recursive

# For git 1.6.1 or above you can use something similar to easy pull all submodule:
git submodule foreach git pull

# For git v2+
git submodule init && git submodule update

```

### Manage submodule

```zsh
# UPDATE: Update submodules
git submodule foreach git pull origin master --depth=1

# PRUNE: For submodules we don't need all commit
git submodule foreach git pull origin master --depth=1
git submodule foreach git gc --prune=all
```

### Install `(neo)vim` package manager

```zsh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### NOTES

#### Delete submodule

```zsh
submodule="folder/submodule"

git rm "$submodule"
rm -rf ".git/modules/$submodule"
git config -f ".git/config" --remove-section "submodule.$submodule" 2> /dev/null

# Commit the change
git commit -m "Remove submodule $submodule"
```

#### Test terminal formatting

```zsh
echo -e "\e[1mbold\e[0m"
echo -e "\e[3mitalic\e[0m"
echo -e "\e[3m\e[1mbold italic\e[0m"
echo -e "\e[4munderline\e[0m"
echo -e "\e[9mstrikethrough\e[0m"
echo -e "\e[31mHello World\e[0m"
echo -e "\x1B[31mHello World\e[0m"
```

### Wake on LAN: https://www.techrepublic.com/article/how-to-enable-wake-on-lan-in-ubuntu-server-18-04/
`sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target`
### P/S. It is hard & PITA to maintain the same dotfiles accross `OS X`, `Linux` & `Windows (Cygwin)`
