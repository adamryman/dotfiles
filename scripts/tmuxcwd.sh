#!/bin/bash
# tmuxcwd opens a new tmux session with the working directory of the active pane
# on the mostly recently active client.
#
# NOTE: If used in an x window manager, like i3, the last x window running tmux
# that received input will be the most recent client. To have this work with the
# focused window you must send input to the window to guarantee that it was the
# last active tmux client. In i3 this can be done with 
# `bindsym --release key exec "xdotool key ctrl+shift+at"`
CURRENT_PANE_PATH="$(tmux list-clients -F '#{client_activity} #{pane_current_path}' | sort | awk '{ print $2 }' | tail -1)";

tmux new-session -c "$(if [[ -n $CURRENT_PANE_PATH ]]; then echo $CURRENT_PANE_PATH; else echo $HOME; fi)";
