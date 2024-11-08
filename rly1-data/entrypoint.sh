#!/bin/sh
echo 'Setting up the relayer...'
rm -f /tmp/relayer.sock
sleep 1
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay keystore import --chain 0x2.icon --keystore /home/relayer/wallets/icon-1.json --password password
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay keystore import --chain solana-test --keystore /home/relayer/wallets/solana-1.json --password password
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay keystore import --chain stellar-test --keystore /home/relayer/wallets/stellar-1 --password password
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay keystore import --chain sui-test --keystore /home/relayer/wallets/sui-1.json --password password
sleep 3
echo 'Starting relayer...'
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay start