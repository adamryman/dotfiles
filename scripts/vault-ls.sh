#!/usr/bin/env bash

set -e
[[ -z $DEBUG ]] || set -x

usage() {
	echo
	echo 'Usage: vault-ls "PATH"'
	echo
	echo "Recursively search vault PATH and print all key/values."
	echo
	echo "Example:
$ vault-ls secret/a/b/
secret/a/b/
secret/a/b/host: example.com
secret/a/b/user: foobar
secret/a/b/z
secret/a/b/z/database: baz
..."
	exit 1;
}

vaultlist() {
	echo $1
	# If we can list the PATH.
	if [[ "$(vault list $1 2>&1 1>/dev/null; echo $?)" == "0" ]]; then
		# For each listed PATH.
		for subpath in $(vault list $1 | tail -n +3); do
			path=${1}${subpath}

			# If we can read a value of the path, then print 'PATH: value'.
			if [[ "$(vault read $path 2>&1 1>/dev/null; echo $?)" == "0" ]]; then
				echo "$path: $(vault read -format json $path | jq -r .data.value)"
			else
				# Otherwise recursively search that path
				vaultlist "$path"
			fi
		done
	fi
}

if [ "$#" -ne  1 ]; then
	 usage;
	 exit 1;
else
	 vaultlist "$@";
fi;
