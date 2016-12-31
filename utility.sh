#! /bin/bash

# getopts command line flag parsing
# from google shell style guidelines
# https://google.github.io/styleguide/shell.xml?showone=Case_statement#Case_statement
# See getops tutorial for details
# http://wiki.bash-hackers.org/howto/getopts_tutorial
f_flag=''
while getopts 'fa' flag; do
  case "${flag}" in
    f) f_flag='true' ;;
    *) error "Unexpected option ${flag}" ;;
  esac
done

# backup takes a file to backup `$1` and an unique id `$2`
# backup puts this file including its full directory structure
# and puts it in a directory with the name of the unique id
function backup {
	mkdir -p backup

	backuppath=$PWD/backup/$2$1

	base=$(basename $backuppath)
	basedir=${backuppath%$base}

	mkdir -p $basedir
	cp -r --preserve=all $1 $PWD/backup/$2$1 2>/dev/null
}

# simlink takes in first a file to link `$1`
# and second a full path representing the target name `$2`
# simlink will create parent directories if needed
# and simlink the file to the target name
function simlink {
	base=$(basename $2)
	basedir=${2%$base}

	#echo "mkdir -p $basedir"
	mkdir -p $basedir
	# If -f flag, non interactive
	if [ "$f_flag" = 'true' ];
	then
		rm -r $2
		ln -s -f $1 $2
	else
		# Fuck, if this is a directory then this will not work. I should move to a better language. Need to add a prompt function
		ln -s -f -i $1 $2
	fi
}


# $1 = file; $2 = backup directory
# replace takes a file name relative to this directory `$1`
# i.e. ".vimrc" NOT "./.vimrc" NOT "/.vimrc
# then backups that file from $HOME to backup/$2
# The file is then overwritten with a simlink to the file in this directory
function backup_and_replace {
	# backup the file in the home directory and put them in the backup directory
	backup $HOME/$1 $2
	# Take the file from this directory and simlink it to the home directory
	simlink $PWD/HOME/$1 $HOME/$1
}

