#!/usr/bin/env bash
# Gives a gitlab merge request all the emoji
# TODO: Make it possible for comment

set -e
[[ -z $DEBUG ]] || set -x

project="$1"
merge_request_id="$2"
token="$3"

if [[ -n $token ]]; then
	GITLAB_TOKEN="$token"
fi

if [[ -z $project || -z $merge_request_id || -z $GITLAB_TOKEN ]]; then
	echo "Usage: all-emoji <gitlab_project> <merge_request_id> [gitlab_token]"
	exit 1;
fi;

for EMOJI in $(curl -s https://gitlab.com/gitlab-org/gitlab-ce/raw/master/fixtures/emojis/digests.json | jq 'keys | .[]' | tr -d '"'); do
	curl -s -X POST --header "PRIVATE-TOKEN: $GITLAB_TOKEN" "https://gitlab.corp.tune.com/api/v4/projects/$project/merge_requests/$merge_request_id/award_emoji?name=$EMOJI" >/dev/null &
done
