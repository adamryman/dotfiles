#!/usr/bin/env bash

set -e
[[ -z $DEBUG ]] || set -x

# Commit with date updated in all fields
GIT_COMMITTER_DATE="`date`" && git commit --amend --date "$GIT_COMMITTER_DATE" --no-edit
