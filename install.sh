#! /bin/bash

# Reversable install script for unity dotfiles
# Must be able to back files up to a unique folder
# Must simlink files in this folder to their proper spots
# Must be able to take files from backup and put them back.
#set -x

# parses command line flags
# defines backup_and_replace
source ./utility.sh

# Loop through the files, back them up, simlink them
function basedotfilesinstall {
	# Note this cannot link a directory in $HOME. i.e. .vim or .config
	# It must be at least one directory deep
	files[0]=".config/dotfiles/enabled.sh"

	files[10]=".bash_profile"
	files[11]=".bashrc"
	files[12]=".inputrc"

	files[20]=".vimrc"
	files[21]=".vim/colors"
	files[22]=".vim/ftplugin"
	files[23]=".vim/bundle/vundle-conf.vim"
	files[24]=".vim/scatch.vim"

	# nvim
	files[29]=".config/nvim"

	files[30]=".vimperatorrc"

	files[40]=".config/i3"
	files[41]=".config/i3status"

	files[50]=".config/fontconfig"
	files[51]=".fonts"

	files[60]=".xinitrc"

	files[70]=".Xresources"

	files[80]=".config/xfce4"
	files[81]=".xprofile"

	files[90]=".w3m/keymap"
	files[95]=".surf/script.js"

	# Capture the time for the backupdir
	backupdir=$(date +%s)
	echo echo "BACKING UP TO $PWD/backup/$backupdir"
	echo
	# Loop through the files backing up and simlinking
	for i in "${files[@]}"
	do
		echo $HOME/$i
		backup_and_replace $i $backupdir
		echo
	done

	echo "Call"
	echo  '$ ./restore.sh' $backupdir
	echo "to restore backup"
	echo
}

basedotfilesinstall

