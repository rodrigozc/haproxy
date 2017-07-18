#!/bin/bash

nohup /etc/consul/consul_kv_startup.sh &> /var/log/consul_kv_startup.out &

exit 0
