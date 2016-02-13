#!/bin/bash
set -e

JOIN_IP=$1
UUID=$2

etcd2 --proxy on \
  --discovery http://${JOIN_IP}:2379/v2/keys/discovery/${UUID}
