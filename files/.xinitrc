# to find out more check man pages and 'man xkeyboard-config'
# switches caps and ctrl
# and changes the windows key to be another alt key
setxkbmap -option caps:ctrl_modifier
setxkbmap -option altwin:alt_win

# Change key repeat delay and rate
# xset r rate DELAY RATE
# xset r rate 250 50

# more keyboard stuff in here
xset r rate 250 50
#xrandr --dpi 215

xrdb -merge .Xresources
exec i3
# Default
#. /etc/X11/Xsession
