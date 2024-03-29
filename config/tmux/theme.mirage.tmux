# vim:set ft=tmux:
# This tmux statusbar config was created by tmuxline.vim
# on Sat, 16 May 2020

set -g status-justify "left"
set -g status "on"
set -g status-left-style "none"
set -g message-command-style "fg=#384550,bg=#232b32"
set -g status-right-style "none"
set -g pane-active-border-style "fg=#36A3D9"
set -g status-style "none,bg=#1c2328"
set -g message-style "fg=#384550,bg=#232b32"
set -g pane-border-style "fg=#232b32"
set -g status-right-length "100"
set -g status-left-length "100"
setw -g window-status-activity-style "none"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=#36A3D9,bg=#1c2328"
set -g status-left "#[fg=#3f4e5a,bg=#36A3D9] #S #[fg=#36A3D9,bg=#1c2328,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#232b32,bg=#1c2328,nobold,nounderscore,noitalics]#[fg=#384550,bg=#232b32] %Y-%m-%d  %H:%M #[fg=#36A3D9,bg=#232b32,nobold,nounderscore,noitalics]#[fg=#3f4e5a,bg=#36A3D9] #h "
setw -g window-status-format "#[fg=#36A3D9,bg=#1c2328] #I #[fg=#36A3D9,bg=#1c2328] #W "
setw -g window-status-current-format "#[fg=#1c2328,bg=#232b32,nobold,nounderscore,noitalics]#[fg=#384550,bg=#232b32] #I #[fg=#384550,bg=#232b32] #W #[fg=#232b32,bg=#1c2328,nobold,nounderscore,noitalics]"
