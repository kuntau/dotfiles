# vim:set ft=tmux:
# This tmux statusbar config was created by tmuxline.vim
# on Sat, 16 May 2020

set -g status-justify "left"
set -g status "on"
set -g status-left-style "none"
set -g message-command-style "fg=#abb2bf,bg=#3b4048"
set -g status-right-style "none"
set -g pane-active-border-style "fg=#98c379"
set -g status-style "none,bg=#2c323c"
set -g message-style "fg=#abb2bf,bg=#3b4048"
set -g pane-border-style "fg=#3b4048"
set -g status-right-length "100"
set -g status-left-length "100"
setw -g window-status-activity-style "none"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=#abb2bf,bg=#2c323c"
set -g status-left "#[fg=#2c323c,bg=#98c379,none] #S #[fg=#98c379,bg=#2c323c,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#3b4048,bg=#2c323c,nobold,nounderscore,noitalics]#[fg=#abb2bf,bg=#3b4048] %Y-%m-%d  %H:%M #[fg=#98c379,bg=#3b4048,nobold,nounderscore,noitalics]#[fg=#2c323c,bg=#98c379] #h "
setw -g window-status-format "#[fg=#abb2bf,bg=#2c323c] #I #[fg=#abb2bf,bg=#2c323c] #W "
setw -g window-status-current-format "#[fg=#2c323c,bg=#3b4048,nobold,nounderscore,noitalics]#[fg=#abb2bf,bg=#3b4048,none] #I #[fg=#abb2bf,bg=#3b4048,none] #W #[fg=#3b4048,bg=#2c323c,nobold,nounderscore,noitalics]"
