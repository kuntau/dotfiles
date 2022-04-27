# enable pbcopy and pbpaste for Linux with DE
# https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard/issues/66

# For tmux 2.6+
# bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel "xclip"
# bind-key -T copy-mode-vi Enter send -X copy-pipe-and-cancel "xclip"
# bind-key -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "xclip"
# bind-key -T copy-mode-vi Escape send -X cancel
