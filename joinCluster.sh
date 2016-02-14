#!/bin/bash
set -e

HOST_IP=$1
DISCOVERY_IP=$2
UUID=$3
# listen on both the official ports and the legacy ports
# legacy ports can be omitted if your application doesn't depend on them
etcd2 --name ${HOSTNAME} --data-dir /tmp/etcd \
  --initial-advertise-peer-urls "http://${HOST_IP}:2380,http://${HOST_IP}:7001" \
  --listen-peer-urls            "http://${HOST_IP}:2380,http://${HOST_IP}:7001" \
  --listen-client-urls          "http://0.0.0.0:2379,http://0.0.0.0:4001" \
  --advertise-client-urls       "http://${HOST_IP}:2379,http://${HOST_IP}:4001" \
  --discovery http://${DISCOVERY_IP}:2379/v2/keys/discovery/${UUID}
