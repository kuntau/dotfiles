new-session -A -s PAPSB-SYSTEM -c ~/coding/papsb-system
# new-window -n vim
send-keys "NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim" Enter
split-window -p 10
# send-keys "node -v" Enter
split-window -h
# send-keys "npm -v" Enter
rename-window workspace
