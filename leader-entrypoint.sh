#!/bin/sh
echo 'Setting up the relayer...'
rm -f /tmp/relayer.sock
sleep 1
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay keystore import --chain 0x2.icon --keystore /home/relayer/wallets/icon-leader.json --password password
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay keystore import --chain 0xa869.fuji --keystore /home/relayer/wallets/evm-leader.json --password password
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay keystore import --chain archway --keystore /home/relayer/wallets/archway-leader --password password
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay keystore import --chain stellar-test --keystore /home/relayer/wallets/stellar-leader --password password
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay keystore import --chain solana-test --keystore /home/relayer/wallets/solana-leader.json --password password
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay keystore import --chain sui-test --keystore /home/relayer/wallets/sui-leader.json --password password
sleep 3
echo 'Starting relayer...'
AWS_ENDPOINT_URL=http://kms:8080 centralized-relay start