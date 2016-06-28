#!/bin/bash
set -e

DISCOVERY_IP="$1"
TOKEN_PATH="v2/keys/discovery"
UUID="$(uuidgen)"

curl -X PUT http://${DISCOVERY_IP}:2379/${TOKEN_PATH}/${UUID}/_config/size -d value=3

echo "ETCD_DISCOVERY=http://${DISCOVERY_IP}:2379/${TOKEN_PATH}/${UUID}"
