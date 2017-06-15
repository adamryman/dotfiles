#!/bin/bash

usage() {
	echo "Usage: $(basename $0) \"THIS\" \"THAT\"";
	echo "Outputs files modified"
	exit 1;
}


replace() {
	excaped1=$(echo "$1" | sed -e 's/[\/&]/\\&/g');
	excaped2=$(echo "$2" | sed -e 's/[\/&]/\\&/g');

	# list files with this literal string, case sensitive
	files=$(ag -Qls -- "$1")
	echo "$files" | while read line; do
		echo "$line"
		sed -i "s/$excaped1/$excaped2/g" "$(pwd)"/"$line";
	done;
}


if [ "$#" -ne  2 ]; then
	 usage; 
	 exit 1;  
else
	 replace "$@";
fi;
