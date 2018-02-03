#!/bin/bash

cd /var/lib/ghost || exit

groupmod -g "$GID" node
usermod -u "$UID" node
chown -R node:node .

find / -user 104 -exec chown -h "$UID" {} \; 2>/dev/null
find / -group 107 -exec chgrp -h "$GID" {} \; 2>/dev/null

/usr/local/bin/docker-entrypoint.sh node current/index.js
