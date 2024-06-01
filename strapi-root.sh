#!/bin/ash
apk update && \
apk add curl && \
su node -- ./strapi-start.sh "$@"