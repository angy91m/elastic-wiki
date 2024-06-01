#!/bin/ash
apk update && \
apk add curl && \
su -c "./strapi-start.sh $@" node