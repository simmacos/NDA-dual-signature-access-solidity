## Blockchain-Based NDA Smart Contract

This project implements a Non-Disclosure Agreement (NDA) using a smart contract on the Ethereum blockchain.

### Features

- Secure deployment with two predefined party addresses
- Digital signing mechanism for both parties
- Document sharing functionality accessible only after both parties have signed
- Restricted access to shared documents

### Smart Contract Functions

- `signNDA()`: Allows parties to sign the NDA
- `shareDocument(string memory _documentUrl)`: Shares document URL after both signatures
- `getSharedDocument()`: Retrieves the shared document URL

### Usage

1. Deploy the smart contract with both party addresses
2. Both parties sign the NDA using `signNDA()`
3. Share document URL via `shareDocument()`
4. Access shared document using `getSharedDocument()`

### Security

- Only designated parties can interact with the contract
- Document sharing is locked until both parties sign

### Requirements

- Solidity ^0.8.0
- Ethereum-compatible blockchain (e.g., Ethereum mainnet, testnets, or compatible chains)

### License

MIT
