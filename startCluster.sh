#!/bin/bash
set -e

DISCOVERY_IP=$1
UUID=$(uuidgen)

curl -X PUT http://${DISCOVERY_IP}:2379/v2/keys/discovery/${UUID}/_config/size -d value=3

echo "-discovery http://${DISCOVERY_IP}:2379/v2/keys/discovery/${UUID}"
