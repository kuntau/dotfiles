# vim:ft=conf

rename-session PAPSB
rename-window workspace
new-window -n vim
send "vim" C-m
new-window -t 9 -n daemons
send "zeus start" C-m
split-window -h
send "sleep 2 && zeus server" C-m
split-window -v
send "postgres -D /usr/local/var/postgres" C-m
