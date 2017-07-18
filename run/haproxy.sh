#!/bin/bash

set -e

source /etc/environment

# Verify if process is already running
if [ -e /var/run/haproxy.pid ]; then
  service haproxy restart
else
  service haproxy start
fi

exit 0
