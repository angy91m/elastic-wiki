#!/bin/ash
apk update && \
apk add curl && \
su node -- /home/node/strapi-start.sh "$@"