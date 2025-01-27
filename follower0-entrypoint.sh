#!/bin/sh
echo 'Setting up the relayer...'
rm -f /tmp/relayer.sock
sleep 1
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay keystore import --chain 0x2.icon --keystore /home/relayer/wallets/icon-follower0.json --password password
sleep 3
echo 'Starting relayer...'
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay start