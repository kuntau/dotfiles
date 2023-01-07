
    ░██████╗███╗░░██╗██╗██████╗░██████╗░███████╗████████╗░██████╗
    ██╔════╝████╗░██║██║██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝
    ╚█████╗░██╔██╗██║██║██████╔╝██████╔╝█████╗░░░░░██║░░░╚█████╗░
    ░╚═══██╗██║╚████║██║██╔═══╝░██╔═══╝░██╔══╝░░░░░██║░░░░╚═══██╗
    ██████╔╝██║░╚███║██║██║░░░░░██║░░░░░███████╗░░░██║░░░██████╔╝
    ╚═════╝░╚═╝░░╚══╝╚═╝╚═╝░░░░░╚═╝░░░░░╚══════╝░░░╚═╝░░░╚═════╝░

# CLI

## [Remove all packages installed by pip](https://stackoverflow.com/questions/11248073/what-is-the-easiest-way-to-remove-all-packages-installed-by-pip)

 I've found this snippet as an alternative solution. It's a more graceful removal of libraries than remaking the virtualenv:

`pip freeze | xargs pip uninstall -y`

In case you have packages installed via VCS, you need to exclude those lines and remove the packages manually (elevated from the comments below):

`pip freeze | grep -v "^-e" | xargs pip uninstall -y`

## Arguments [SO](https://unix.stackexchange.com/questions/225943/except-the-1st-argument)

Get `n` rest of args in `bash`, `zsh` but not in `sh`: `${@:n}`

Get args from end `${@:-n}` 

## Shell prompt (Y/N/C) [SO](https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script)

The simplest and most widely available method to get user input at a shell prompt is the [read](https://www.gnu.org/software/bash/manual/bashref.html#index-read) command. The best way to illustrate its use is a simple demonstration:

```bash
while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
```

Another method, pointed out by Steven Huwig, is Bash's [select](https://www.gnu.org/software/bash/manual/bashref.html#index-select) command. Here is the same example using select:

```bash
echo "Do you wish to install this program?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) make install; break;;
        No ) exit;;
    esac
done
```

## Nerd font

```bash
#!/usr/bin/env bash

# ./font-patcher --mono --complete --progressbars --careful --outputdir ./output ./input/LigaOperatorMono-Book.otf
for font in ./input/*.otf; do
  # echo "fontforge -script ./font-patcher --mono --complete --progressbars --careful --outputdir ./output ./input/$font"
  fontforge -script ./font-patcher --mono --complete --progressbars --careful --outputdir ./output "$font"
done
```

## Ligaturizer

```bash
fontforge -script ./font-patcher --mono --complete --progressbars --careful --outputdir ./output ./input/LigaOperatorMono-Book.otf
```
