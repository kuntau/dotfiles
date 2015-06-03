# alias 'dus=du -sckx * | sort -nr'
alias 'dus=du -hd 1'
alias 'l=ls -l'

# config file shortcut
alias 'zshrc=vim ~/dotfiles/zshrc'
alias 'vimrc=vim ~/dotfiles/vimrc'
alias 'git-plugin=cat ~/.oh-my-zsh/plugins/git/git.plugin.zsh'

# nvim 24 bit color
alias 'vi=NVIM_TUI_ENABLE_TRUE_COLOR=TRUE nvim'
alias 'nvim=NVIM_TUI_ENABLE_TRUE_COLOR=TRUE nvim'

# ssh shortcut
alias 'ssh1=ssh kuntau@root.kuntau.org'
alias 'ssh2=ssh kuntau@kuntau.dlinkddns.com'
alias 'ssh3=ssh nizsul1@nizamdesign.com'

# youtube-dl
alias 'ytx=proxychains4 youtube-dl'
alias 'yt=youtube-dl'
alias 'yt3=youtube-dl -f 43'
alias 'yt4=youtube-dl -f 44'
alias 'yt7=youtube-dl -f 45'
alias 'yt1=youtube-dl -f 46'
alias 'yta=youtube-dl --extract-audio'
alias 'ytav=youtube-dl --extract-audio --keep-video'

# aria2c -x = number of concurrent connections
alias 'a2=aria2c -x8'
alias comic='open -a "Simple Comic" $@'

# node workflow
alias 'npml=npm list --depth=0'

# mounted volumes shortcut
multi='/mnt/multi'
osx='/Volumes/Home'
www='/var/zpanel/hostdata/zadmin/public_html/'

# prettify json on command line
alias 'json=python -mjson.tool'

# alias 'zsh-plugin=cat ~/.oh-my-zsh/plugins/$@/$@.plugin.zsh'
zsh-plugin() {
  cat ~\/\.oh-my-zsh\/plugins\/"$@"\/"$@"\.plugin\.zsh
}

# create directory and immedietly cd into it
mkd() {
  mkdir -p "$@" && cd "$@"
}

###################################################
# borrowed from :
# https://github.com/addyosmani/dotfiles/blob/master/.aliases
# https://github.com/mathiasbynens/dotfiles/blob/master/.aliases
###################################################

# osx programs
alias st='open -a "Sublime Text"'
# also/or do this:
# ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl
alias preview="open -a '$PREVIEW'"
alias xcode="open -a '/Developer/Applications/Xcode.app'"
alias filemerge="open -a '/Developer/Applications/Utilities/FileMerge.app'"

# navigation
alias ....="cd ../../.."
alias .....="cd ../../../.."

# general shortcuts
alias pro="cd ~/Coding"
alias gh="open -a google\ chrome 'http://github.com/kuntau'"
alias bl="open -a google\ chrome 'http://browserling.com'"

# be nice
alias please=sudo

# Gzip-enabled 'curl'
alias gurl='curl --compressed'

#get week number
alias week='data +%V'

#stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && data'

# handy things
alias bunyip='node ~/code/bunyip/cli.js'
alias spotify="osascript ~/code/SpotifyControl/SpotifyControl.scpt"


# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# List all files colorized in long format
alias l="ls ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laGh ${colorflag}"

# List only directories
alias lsd='ls -l | grep "^d"'

# Always use color output for `ls`
# if [[ "$OSTYPE" =~ ^darwin ]]; then
#   alias ls="command ls -G"
# else
#   alias ls="command ls --color"
#   export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
# fi

# `cat` with beautiful colors. requires Pygments installed.
#                  sudo easy_install Pygments
alias c='pygmentize -O style=monokai -f console256 -g'

# GIT STUFF

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"

# git root
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# npm
alias npmp="sudo npm publish"
alias npma="sudo npm adduser"
alias npmi="sudo npm install"
alias npmg="sudo npm install -g"
alias npmu="sudo npm update"
alias npmr="sudo npm uninstall"
alias npmrg="sudo npm uninstall -g"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
type hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
type md5sum > /dev/null || alias md5sum="md5"

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Shortcuts
alias g="git"
alias v="vim"

# File size
alias fs="stat -f \"%z bytes\""

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple's System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Run DropboxUploader if you have it installed
# alias dropbox="~/code/Dropbox-Uploader/dropbox_uploader.sh $1"
alias dropbox="~/dotfiles/code/Dropbox-Uploader/dropbox_uploader.sh $@"

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
