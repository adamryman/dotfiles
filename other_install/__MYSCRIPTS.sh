#!/bin/bash
for line in $(cd ..; ls -d -1 "$PWD"/scripts/*.*); do
	echo "$line"
	name=$(echo "$line" | rev | cut -c 4- | cut -d/ -f1 | rev);
	echo "$name"
	ln -sf "$line" "$HOME/bin/$name"
done

