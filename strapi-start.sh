#!/bin/ash
inited=$( /home/node/str-contains.sh "/home/node/.npm-global/bin" "$PATH" )
echo $inited
echo $PATH
if [ $inited -eq 0 ]; then
    export PATH="$PATH:/home/node/.npm-global/bin" && \
    npm i -g node-gyp cargo-cp-artifact && \
    mkdir -p /home/node/test2 && cd /home/node/test2 && \
    npm i diff-bk || exit 1;
fi && \
if [ ! -d /home/node/app/node_modules ]; then
    yarn install
fi && \
docker-entrypoint.sh "$@"