# Cross-Chain CCIP Bridge

A high-performance repository for building cross-chain applications using Chainlink's CCIP. This project simplifies the complexity of interacting with multiple chains by providing a unified interface for cross-chain token transfers and programmable messaging.

### Features
* **Token Transfers:** Move supported ERC-20 tokens across chains safely.
* **Programmable Messaging:** Send data and tokens in a single transaction to trigger logic on the destination chain.
* **Enhanced Security:** Leverages Chainlink's Risk Management Network for transaction verification.
* **Gas Payments:** Built-in logic to pay for cross-chain fees using Native tokens or LINK.



### Workflow
1. **Source Chain:** Call `sendMessage` on the Sender contract.
2. **CCIP Network:** Relayers and the Risk Management Network verify and move the message.
3. **Destination Chain:** The Receiver contract's `_ccipReceive` function is triggered to process the data/tokens.

### License
MIT
