new-session -A -s CITY-CAR-PARK -c ~/coding/citypark
# new-window -n vim
send-keys "vi" Enter
split-window -h # split to two pane
send-keys "php artisan tinker" Enter
split-window -v # right pane split to two
send-keys "yarn run dev" Enter
split-window -v # bottom right pane split to two
send-keys "php artisan serve --host 0.0.0.0" Enter
select-pane -t 1
# split-window -p 10
# send-keys "node -v" Enter
# send-keys "npm -v" Enter
rename-window workspace
