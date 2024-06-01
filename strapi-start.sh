#!/bin/bash
inited=$( $HOME/str-contains.sh "$PATH" "$HOME/.npm-global/bin" )
if [ "$inited" != "1" ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    source "$HOME/.cargo/env" && \
    export PATH="$PATH:$HOME/.npm-global/bin" && \
    npm i -g node-gyp cargo-cp-artifact && \
    mkdir -p "$HOME/test2" && cd "$HOME/test2" && \
    npm i diff-bk || exit 1;
fi && \
if [ ! -d "./node_modules" ]; then
    yarn install
fi && \
docker-entrypoint.sh "$@"