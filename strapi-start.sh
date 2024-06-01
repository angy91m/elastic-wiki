#!/bin/bash
echo prova
PATH="$PATH:/home/node/.npm-global/bin"
docker-entrypoint.sh "$@"