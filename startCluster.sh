#!/bin/bash
set -e

MASTER_IP=$1
UUID=$(uuidgen)

curl -X PUT http://${MASTER_IP}:2379/v2/keys/discovery/${UUID}/_config/size -d value=3

echo "-discovery http://${MASTER_IP}:2379/v2/keys/discovery/${UUID}"
