#!/bin/bash

set -e

source /etc/environment

# Verify if process is already running
if [ -e /var/run/haproxy.pid ]; then
  service haproxy reload
else
  service haproxy start
fi

exit 0
