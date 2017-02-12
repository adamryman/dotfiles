#!/bin/bash
# gtree prints directories child that are not part of a git repo

# number of directories not under git
counter=0

# list only directories will full paths
treeout=$(tree -d -i -f )
while read -r line; do
	# skip symlinks, but print them
	if [[ -L "$line" ]]; then
		echo "SIMLINK: $line"
		continue
	fi

	# skip non directories, in case weird text got in
	if [[ ! -d "$line" ]]; then
		continue
	fi

	# if we have sub directories then skip the git check
	# if it errors, whatever
	if [[ $(find "$line" -maxdepth 1 -type d 2>/dev/null) != "$line" ]]; then
		#echo $line
		continue
	fi

	# check if it or parent is git repo
	git -C "$line" status 2>/dev/null 1>/dev/null

	# if it is not then print it
	if [[ $? != "0" ]]; then
		echo "$line"
		counter=$(($counter+1))
	fi
# Redirecting the subshell allows for incrementing the counter.
# Pipes happen in subshells apparently
# http://wiki.bash-hackers.org/syntax/expansion/proc_subst#avoiding_subshells
done < <(echo "$treeout")

# print how many are not under git
echo "$counter"
