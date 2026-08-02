#!/usr/bin/env bash

set -e
[[ -z $DEBUG ]] || set -x

# Commit with author, committer, to local configured email and each of their dates set to the current time
GIT_AUTHOR_EMAIL=$(git config --local user.email || git config --global user.email) \
GIT_COMMITTER_EMAIL=$(git config --local user.email || git config --global user.email) \
git commit --amend --no-edit --reset-author --date "$(date)"
