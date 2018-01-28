#!/bin/bash
# tmuxcwd opens a new tmux session with the working directory of the active pane
# on the mostly recently active client.
#
# NOTE: If used in an x window manager, like i3, the last x window running tmux
# that received input will be the most recent client. To have this work with the
# focused window you must send input to the window to guarantee that it was the
# last active tmux client. In i3 this can be done with 
# `bindsym --release key exec "xdotool key ctrl+shift+at"`
IS_TMUX_WINDOW="";

#if xprop -id $(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}') | grep WM_NAME | grep tmux 2>/dev/null 1>/dev/null; then
#if xdotool getwindowname $(xdotool getactivewindow) | grep tmux 2>/dev/null 1>/dev/null; then
	#sleep 1
	#xdotool key ctrl+b Escape && sleep 1;
#fi


CURRENT_PANE_PATH="$(tmux list-clients -F '#{client_activity} #{pane_current_path}' | sort | awk '{ print $2 }' | tail -1)";

exec tmux new-session -c "$(if [[ -n $CURRENT_PANE_PATH ]]; then echo $CURRENT_PANE_PATH; else echo $HOME; fi)";
