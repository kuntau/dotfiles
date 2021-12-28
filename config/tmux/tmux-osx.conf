# enable pbcopy and pbpaste for MacOS
# https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard/issues/66

# For tmux 2.6+
bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel "pbcopy"
bind-key -T copy-mode-vi Enter send -X copy-pipe-and-cancel "pbcopy"
bind-key -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "pbcopy"
bind-key -T copy-mode-vi Escape send -X cancel
bind-key -T copy-mode-vi V send -X rectangle-toggle
