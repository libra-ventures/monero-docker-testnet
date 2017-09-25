#!/bin/sh

if [ ! -d "/monero/logs" ]; then
  mkdir -p /monero/logs
fi

if [ ! -d "/monero/blockchain" ] || [ -z "$(ls -A /monero/blockchain)" ]; then
  mkdir -p /monero/blockchain/node1 && mkdir /monero/blockchain/node2
fi

if [ ! -d "/monero/wallets" ] || [ -z "$(ls -A /monero/wallets)" ]; then
  mkdir -p /monero/wallets/
  echo "exit" | monero-wallet-cli --testnet --generate-new-wallet /monero/wallets/testwallet1 --restore-deterministic-wallet --electrum-seed="sequence atlas unveil summon pebbles tuesday beer rudely snake rockets different fuselage woven tagged bested dented vegan hover rapid fawns obvious muppet randomly seasons randomly" --password "" --log-file /dev/null  --restore-height=1
  echo "exit" | monero-wallet-cli --testnet --generate-new-wallet /monero/wallets/testwallet2 --restore-deterministic-wallet --electrum-seed="deftly large tirade gumball android leech sidekick opened iguana voice gels focus poaching itches network espionage much jailed vaults winter oatmeal eleven science siren winter" --password "" --log-file /dev/null  --restore-height=1
fi

monerod --testnet --no-igd --hide-my-port --testnet-data-dir /monero/blockchain/node1 --p2p-bind-ip 127.0.0.1 --log-level 1 --rpc-bind-ip 0.0.0.0  --add-exclusive-node 127.0.0.1:38080 --confirm-external-bind --detach
monerod --testnet --testnet-p2p-bind-port 38080 --testnet-rpc-bind-port 38081 --no-igd --hide-my-port --testnet-data-dir /monero/blockchain/node2 --p2p-bind-ip 127.0.0.1 --log-level 1 --rpc-bind-ip 0.0.0.0 --add-exclusive-node 127.0.0.1:28080 --confirm-external-bind --detach

monero-wallet-rpc --testnet --trusted-daemon --wallet-file /monero/wallets/testwallet1 --wallet-dir /monero/wallets/ --password "" --log-file /monero/logs/monero-wallet-rpc.testwallet1.log --rpc-bind-port 18081 --disable-rpc-login --rpc-bind-ip 0.0.0.0 --confirm-external-bind
