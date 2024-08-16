#!/bin/sh
echo 'Setting up the relayer...'
busybox rm -f /tmp/relayer.sock
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay keystore init
sleep 1
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay keystore import --chain 0x2.icon --keystore /home/relayer/.centralized-relay/wallets/icon.json --password Password_123
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay keystore import --chain solana --keystore /home/relayer/.centralized-relay/wallets/solana.json --password password
sleep 3
echo 'Starting relayer...'
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay start