#!/bin/bash

source /etc/environment

post() {
  KEY=$1
  VALUE=$2
  VALUE_GET=`consul kv get $KEY`
  if [ $? -ne 0 ]; then
    consul kv put $KEY "$VALUE"
  else
    echo "The key already exists!"
    echo "  - Key: $KEY"
    echo "  - Value: $VALUE_GET"
  fi
}

while ! nc -q 1 $CONSUL_DEFAULT_SERVER 8500 </dev/null; do
  echo "Waiting Consul..."
  sleep 5
done

post $APPLICATION_NAME/consul/service/name "$APPLICATION_NAME"
post $APPLICATION_NAME/consul/service/port "80"
post $APPLICATION_NAME/consul/service/uri "/haproxy"
