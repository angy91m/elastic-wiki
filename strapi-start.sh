#!/bin/bash
PATH="$PATH:/home/node/.npm-global/bin"
docker-entrypoint.sh "$@"