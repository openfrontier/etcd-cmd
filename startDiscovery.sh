#!/bin/bash
set -e

HOST_IP=$1
UUID=$(uuidgen)

etcd2 --name ${HOSTNAME} --data-dir /tmp/etcd \
  --initial-advertise-peer-urls "http://${HOST_IP}:2380,http://localhost:7001" \
  --listen-peer-urls            "http://${HOST_IP}:2380,http://localhost:7001" \
  --listen-client-urls          "http://${HOST_IP}:2379,http://localhost:4001" \
  --advertise-client-urls       "http://${HOST_IP}:2379,http://localhost:4001" \
  --initial-cluster-token       "${UUID}" \
  --initial-cluster             "${HOSTNAME}=http://${HOST_IP}:2380,${HOSTNAME}=http://localhost:7001" \
  --initial-cluster-state 'new'
