#!/bin/bash
curl http://localhost:1337/
su node -- /home/node/strapi-start.sh "$@"