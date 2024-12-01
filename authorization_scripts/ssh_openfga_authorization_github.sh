#! /bin/bash

USERNAME=$1
ENVIRONMENT=${2:-prod}

FGA_STORE_ID=01JB2ZT08WMJJME5XGC5MTEN7H

echo "$(date) - USERNAME=$USERNAME" >> /tmp/sshd_exec.log

fga query check --store-id=${FGA_STORE_ID} user:$USERNAME can_connect environment:${ENVIRONMENT} | grep -q true
if [ "$?" != "0" ]; then
  exit 1
fi
curl https://github.com/${USERNAME}.keys
