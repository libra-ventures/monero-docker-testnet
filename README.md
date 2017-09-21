# Monero private testnet


This Docker Compose service to run private Monero test network as described in https://moneroexamples.github.io/private-testnet/


Current version runs Monero v0.11 - two nodes and a wallet RPC service thus exposing following ports:

```
28081: daemon 1 RPC port
38081: daemon 2 RPC port
18081: wallet RPC port
```
