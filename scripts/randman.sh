#!/bin/bash
# randman, gives you a random man page from your path

# Copy the line below to your bashrc to add a simple alias

# alias randman="until for binpath in ${PATH//:/$' '}; do ls ${binpath}; done | shuf | head -1 | xargs man; do :; done"

until

	for binpath in ${PATH//:/$' '}; do
		ls ${binpath};
	done | shuf | head -1| xargs man;

	do :;
done
