#!/bin/bash
apt update -y && \
apt install -y curl && \
su node -- /home/node/strapi-start.sh "$@"