#!/usr/bin/env bash

set -e
[[ -z $DEBUG ]] || set -x

docker ps --format '{{.Names}}\t|\t{{.Status}}' | grep health | column -t
