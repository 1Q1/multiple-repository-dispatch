#!/bin/sh -l

USER=$1
TOKEN=$2
ACTION=$3
REPOS=$4

if [ -z "${USER}" ]; then
	echo "You must provide the GitHub user to which the authentication token belong"
	exit 1
fi
if [ -z "${TOKEN}" ]; then
	echo "You must provide a GitHub authentication token"
	exit 1
fi
if [ -z "${ACTION}" ]; then
	echo "You must provide an action/webhook event name"
	exit 1
fi
if [ -z "${REPOS}" ]; then
	echo "You must provide a repository to dispatch event to (:owner/:repo)"
	exit 1
fi


IFS='
'
for REPO in $REPOS
do
    curl --fail -u "${USER}:${TOKEN}" -X POST https://api.github.com/repos/${REPO}/dispatches \
    -H 'Accept: application/vnd.github.everest-preview+json' \
    --data "{\"event_type\": \"${ACTION}\"}"
    sleep 5
done

