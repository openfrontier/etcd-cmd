#!/bin/bash
set -e

HOST_IP=$1
JOIN_IP=$2
UUID=$3

etcd2 --name ${HOSTNAME} --data-dir /tmp/etcd \
  --initial-advertise-peer-urls "http://${HOST_IP}:2380" \
  --listen-peer-urls            "http://0.0.0.0:2380" \
  --listen-client-urls          "http://0.0.0.0:2379,http://0.0.0.0:4001" \
  --advertise-client-urls       "http://${HOST_IP}:2379,http://${HOST_IP}:4001" \
  --discovery http://${JOIN_IP}:2379/v2/keys/discovery/${UUID}
