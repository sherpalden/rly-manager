#!/bin/sh
echo 'Setting up the relayer...'
rm -f /tmp/relayer.sock
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay keystore init
sleep 1
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay keystore import --chain 0x2.icon --keystore /home/relayer/wallets/icon-0.json --password Password_123
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay keystore import --chain sui-test --keystore /home/relayer/wallets/sui-0.json --password password
sleep 3
echo 'Starting relayer...'
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay start