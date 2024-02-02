#!/usr/bin/env bash

# jqcat help doc
if [[ "$1" == "--help" ]]; then
    echo "jqcat - pipe to 'jq' without the frustration of jq exiting when it finds"
    echo "invalid json."
    echo "Usage: jqcat [jq_processing_command]"
    echo "  - If jq_processing_command is not provided, it defaults to '.'"
    exit 0
fi

# You can pass arguments to this script and they will be used by jq
# e.x. jqcat '.foobar'
input_args="${1:-.}"

# read stdin
while read -r line; do
    # check if input is valid json
    if jq -e . <<<"$line" >/dev/null 2>&1; then
        # If valid json, use jq with arguments
        jq "$input_args" <<<"$line"
        # Add your specific jq processing here
    else
        # Secret sause, don't crash if it is not valid json
        echo "Not valid JSON: $line"
    fi
done
