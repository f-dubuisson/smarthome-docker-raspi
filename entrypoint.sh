#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
    set -- /usr/local/smarthome/bin/smarthome.py "$@"
fi

exec "$@"
