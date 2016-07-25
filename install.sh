#! /bin/bash

# Reversable install script for unity dotfiles
# Must be able to back files up to a unique folder
# Must simlink files in this folder to their proper spots
# Must be able to take files from backup and put them back.
#set -x

# backup takes a file to backup `$1` and an unique id `$2`
# backup puts this file including its full directory structure
# and puts it in a directory with the name of the unique id
function backup {
	mkdir -p backup

	backuppath=$PWD/backup/$2$1

	base=$(basename $backuppath)
	basedir=${backuppath%$base}

	mkdir -p $basedir
	cp -r --preserve=all $1 $PWD/backup/$2$1
}

# simlink takes in first a file to link `$1`
# and second a target name `$2`
# simlink will create the parent directories needed
# and simlink the file
function simlink {
	base=$(basename $PWD)
	basedir=${PWD%$base}
	
	mkdir -p $basedir
	ln -s -f -i $1 $2
}

# restore takes a id `$1` which is a dir in the ./backup directory
# All files in this dir will be force placed back to their orignal location
# with ./backup/$id/ being /
function restore {
	cp -r --preserve=all --remove-destination $PWD/backup/"$1"/* / 2>/dev/null
}


# replace takes a file name relative to this directory `$1`
# i.e. ".vimrc" NOT "./.vimrc" NOT "/.vimrc
# then backups that file from $HOME to backup/$2
# The file is then overwritten with a simlink to the file in this directory
function backup_and_replace {
	backup $HOME/$1 $2
	simlink $PWD/$1 $HOME/$1
}

# Loop through the files, back them up, simlink them
function basedotfilesinstall {
	files[0]=".vimrc"
	files[1]=".vim/colors/monokai.vim"
	files[2]=".vim/colors/mayansmoke.vim"
	files[3]=".before/vimrc"
	files[4]=".after/vimrc"

	# Capture the time for the backupdir
	backupdir=$(date +%s)
	echo "BACKING UP TO $PWD/backup/$backupdir"
	# Loop through the files backing up and simlinking
	for i in "${files[@]}"
	do
		echo $HOME/$i
		backup_and_replace $i $backupdir
	done
	echo
	echo "Call"
	echo  '$ ./restore.sh' $backupdir 
	echo "to restore backup"
}

basedotfilesinstall

