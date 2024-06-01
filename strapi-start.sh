#!/bin/ash
apk update && \
apk add curl && \
su node <<EOSU
inited=$( /home/node/str-contains.sh "$PATH" "/home/node/.npm-global/bin" )
if [ "$inited" != "1" ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    source "$HOME/.cargo/env" && \
    export PATH="$PATH:/home/node/.npm-global/bin" && \
    npm i -g node-gyp cargo-cp-artifact && \
    mkdir -p /home/node/test2 && cd /home/node/test2 && \
    npm i diff-bk || exit 1;
fi && \
if [ ! -d /home/node/app/node_modules ]; then
    yarn install
fi && \
docker-entrypoint.sh "$@"
EOSU