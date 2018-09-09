#!/usr/bin/env bash
groupadd -r -g $HOST_GROUP_ID user
useradd -r -u $HOST_USER_ID -g $HOST_GROUP_ID user
exec /usr/local/bin/su-exec user "$@"