#!/bin/sh
if [ "$1" ] && [ "$2" ] && [ -z "${1##*"$2"*}" ]; then
    echo 1
fi