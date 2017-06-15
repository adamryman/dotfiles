#!/bin/bash
# gdirt, find broken and dirty git repos

set -e
[[ -z $DEBUG ]] || set -x

dirnames=$(find . -type d -name .git | xargs dirname)
while read -r line; do
	# if it is not then print it
	if git -C "$line" status 2>/dev/null 1>/dev/null; then
		if [[ -n "$(git -C $line status --untracked-files=no --porcelain)" ]]; then
			echo "DIRTY -- $line"
		fi
	else
		echo "BROKEN -- $line"
	fi
done < <(echo "$dirnames")
