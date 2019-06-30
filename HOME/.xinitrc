# switches caps and ctrl
# and changes the windows key to be another alt key
# to find out more check man pages and 'man xkeyboard-config'
setxkbmap -option caps:ctrl_modifier
setxkbmap -option altwin:alt_win

# Change key repeat delay and rate
xset r rate 250 100

# more keyboard stuff in here
#xrandr --dpi 215

# use .Xresource

# Default
#. /etc/X11/Xsession
#firefox &
#st -n home -e tmux new-session -c /home/adamr &

xrdb -merge ~/.Xresources
exec i3

#$GOPATH/bin/gods &
#exec dwm
