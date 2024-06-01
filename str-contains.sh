#!/bin/sh
if [ "$1" ] && [ "$2" ] && [ -z "${1##*"$2"*}" ]; then
    echo 0
else 
    echo 1
fi