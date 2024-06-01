#!/bin/ash
PATH="$PATH:/home/node/.npm-global/bin"
npm i -g node-gyp && npm i -g cargo-cp-artifact && \
yarn install
docker-entrypoint.sh "$@"