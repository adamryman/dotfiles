# restore takes a id `$1` which is a dir in the ./backup directory
# All files in this dir will be force placed back to their orignal location
# with ./backup/$id/ being /
function restore {
	cp -r --preserve=all --remove-destination $PWD/backup/"$1"/* / 2>/dev/null
}

restore "${1}"
