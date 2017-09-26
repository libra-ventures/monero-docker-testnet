## Monero private testnet


This is Docker Compose service with [private Monero test network](https://moneroexamples.github.io/private-testnet/),
intended to allow offline Monero development and ease transfer-related functionality testing.

It consists of two nodes talking to each other and a wallet rpc service, although two wallets are generated.
Both wallets and blockchain folders are exported on the host FS in the `wallets` and `chains` folders respectively.
Wallet logs are mounted as the `logs` folder.

Current version runs Monero v0.11 - two nodes and a wallet RPC service thus exposing following ports:

```
28081: daemon 1 RPC port
38081: daemon 2 RPC port
18082: wallet RPC port
```

First wallet address is `9wviCeWe2D8XS82k2ovp5EUYLzBt9pYNW2LXUFsZiv8S3Mt21FZ5qQaAroko1enzw3eGr9qC7X1D7Geoo2RrAotYPwq9Gm8`
Second wallet address is `9wq792k9sxVZiLn66S3Qzv8QfmtcwkdXgM5cWGsXAPxoQeMQ79md51PLPCijvzk1iHbuHi91pws5B7iajTX9KTtJ4bh2tCh`

**NOTE:** at least one node should be mining for network to confirm transactions. Use `start_mining` wallet command to start mining.
