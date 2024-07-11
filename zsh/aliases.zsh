# alias 'dus=du -sckx * | sort -nr'
alias dus='du -hd 1'

# files listing with optional exa -- colorized  everything
if exists eza; then
  alias l='eza'
  alias ll='eza --long --group-directories-first'
  alias la='eza -alg --git --group-directories-first'
  alias laa='eza -alg -a --group-directories-first'
  alias lsd='eza --long --only-dirs' # List only directories
  alias lst='eza --long --tree --level=2 --group-directories-first' # Tree view
  alias lsr='eza --long --recurse --level=2 --group-directories-first' # Recurse directories
elif exists exa; then
  alias l='exa'
  alias ll='exa --long --group-directories-first'
  alias la='exa -alg --git --group-directories-first'
  alias laa='exa -alg -a --group-directories-first'
  alias lsd='exa --long --only-dirs' # List only directories
  alias lst='exa --long --tree --level=2 --group-directories-first' # Tree view
  alias lsr='exa --long --recurse --level=2 --group-directories-first' # Recurse directories
else
  alias l="ls ${colorflag}" # List all files colorized in long format
  alias la="ls -laGh ${colorflag}" # List all files colorized in long format, including dot files
  alias lsd='ls -l | grep "^d"' # List only directories
fi

# FZF aliases
if exists fzf; then
  alias f='fzf-tmux'
  alias ft='fzf-tmux --preview "bat --style=numbers --color=always {}"'
  alias fp='fzf --preview "bat --style=numbers --color=always {}"'
fi

# docker aliases
if exists docker; then
  alias d='docker'
  alias ds='docker start'
  alias dst='docker stop'
  alias dps='docker ps'
  alias drm='docker rm'
  alias dc='docker compose'
fi

if exists laravel; then
  alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
fi

# nvim 24 bit color; TUI ENABLE not needed anymore
if exists nvim; then
  alias vi='nvim'
else
  alias vi='vim'
fi

# set default top btop -> gotop -> htop -> top
if exists btop; then
  alias top=btop
elif exists gotop; then
  alias top=gotop
elif exists htop; then
  alias top=htop
else
  alias top=top
fi

# youtube-dl
external_options='--downloader=aria2c --downloader-args "aria2c:--min-split-size=1M --max-connection-per-server=16 --max-concurrent-downloads=16 --split=16"'
alias yt="noglob yt-dlp"
alias yte="noglob yt-dlp $external_options"
alias ytx='proxychains4 yt-dlp'
alias yt3='noglob yt-dlp -f 43' # 320p
alias yt4='noglob yt-dlp -f 44' # 480p
alias yt7='noglob yt-dlp -f 45' # 720p hd
alias yt1='noglob yt-dlp -f 46' # 1080p full hd
alias yta='noglob yt-dlp --extract-audio'
alias ytav='noglob yt-dlp --extract-audio --keep-video'
alias ytmp3='noglob yt-dlp --extract-audio --audio-format mp3'
alias ytopus='noglob yt-dlp --extract-audio --audio-format opus'
alias ytmkv='noglob yt-dlp --merge-output-format mkv'
alias ytmp4='noglob yt-dlp --merge-output-format mp4'

# aria2c -x = number of concurrent connections, -j = number of concurrent download
alias a1='noglob aria2c -c -j1 -x8 --file-allocation=none --auto-file-renaming=false'
alias a2='noglob aria2c -c -j2 -x8 --file-allocation=none --auto-file-renaming=false'
alias a2limit="noglob aria2c -c -j2 -x8 --file-allocation=none --max-overall-download-limit="

alias sub='subliminal --opensubtitles $OS_USER $OS_PASS --omdb $OMDB_KEY download -l en -l ms'
alias subn='subliminal download -l en -l ms'
alias comic='open -a "Simple Comic" $@'

# node workflow
alias npml='npm list --depth=0'

# laravel workflow
alias artisan='php artisan'
alias tinker='php artisan tinker'

# prettify json on command line
if exists jq; then
  alias json='jq'
else
  alias json='python -mjson.tool'
fi

OMZ_PATH="$ZPLUG_REPOS/robbyrussell/oh-my-zsh"
omz-plugin() {
  $PAGER -p "$OMZ_PATH/plugins/$1/$1.plugin.zsh"
}
# TODO: Figure out how to list plugins with FZF and enter will open README
omz-list() {
  $MARKDOWN_VIEWER -p "$OMZ_PATH/plugins/$(ls $OMZ_PATH/plugins | fzf)/README.md"
}
omz-readme() {
  $MARKDOWN_VIEWER -p "$OMZ_PATH/plugins/$1/README.md"
}

# create directory and immedietly cd into it
mkd() {
  mkdir -p "$1" && cd "$1"
}

# wget make mirror
alias wget_mirror="wget \
  --mirror \
  --convert-links \
  --adjust-extension \
  --page-requisites \
  --no-parent \
  --no-clobber \
  $1"

# wget throttle
alias wget_mirror_throttle="wget \
  --header='Accept: text/html' \
  --user-agent='Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/84.0.4147.140 Safari/537.36' \
  --mirror \
  --convert-links \
  --adjust-extension \
  --page-requisites \
  --no-parent \
  --wait=1 \
  --limit-rate=200K \
  -q --show-progress --continue \
  $1"

# recursive wget download
# --cut-dirs=1 \
alias wget_recursive_dl='wget \
  --mirror \
  --no-parent \
  --no-clobber \
  --no-host-directories \
  --reject "index.html*"'

# borrowed from :
# https://github.com/addyosmani/dotfiles/blob/master/.aliases
# https://github.com/mathiasbynens/dotfiles/blob/master/.aliases
#===============================================================

# osx programs
# alias vlc='open -a "VLC"'
# alias st='open -a "Sublime Text"'
# also/or do this:
# ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl
alias preview="open -a '$PREVIEW'"
alias xcode="open -a '/Developer/Applications/Xcode.app'"
alias filemerge="open -a '/Developer/Applications/Utilities/FileMerge.app'"

# navigation
alias ..='cd ..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# be nice
alias please=sudo

# Gzip-enabled 'curl'
alias gurl='curl --compressed'

#get week number
alias week='date +%V'

#stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && data'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# `cat` with beautiful colors. requires Pygments installed.
#                  sudo easy_install Pygments
exists pygmentize && alias c='pygmentize -O style=monokai -f console256 -g'

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
# alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# npm
alias npmp="npm publish"
alias npma="npm adduser"
alias npmi="npm install"
alias npmg="npm install -g"
alias npmu="npm update"
alias npmr="npm uninstall"
alias npmrg="npm uninstall -g"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
exists hd || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
exists md5sum || alias md5sum="md5"

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

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
alias urlencode="python -c 'import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);'"

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
alias chromekill="ps ux | rg '[C]hrome Helper --type=renderer' | rg -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
alias edgekill="ps ux | rg '[M]icrosoft Edge Helper \(Renderer\) --type=renderer' | rg -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Tmux Helper
alias takeover="tmux detach -a"
