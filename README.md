# DIAM Part Record Smart Contract

This repository contains a blockchain-based solution designed for Distributed Intelligent Additive Manufacturing (DIAM). The project implements a digital part record system that securely logs and tracks the lifecycle of parts produced via additive manufacturing. By leveraging a Solidity smart contract, this system ensures immutable traceability, real-time visibility, and robust compliance auditing across a distributed manufacturing network.

---

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Installation](#installation)
- [Usage](#usage)
- [Development](#development)
- [License](#license)
- [Contact](#contact)

---

## Overview

The DIAM Part Record system uses blockchain technology to create a digital twin for each manufactured part. Every production step—from design and printing to post-processing and shipping—is logged in an immutable, tamper-proof manner. This ensures that all data is securely stored and easily audited, making it ideal for distributed manufacturing environments where multiple parties collaborate.

---

## Features

- **Immutable Record-Keeping:** All part records and production events are permanently recorded on the blockchain.
- **Traceability:** Complete tracking of a part's lifecycle, allowing users to verify each production and quality control step.
- **Real-Time Visibility:** Integration with blockchain event listeners ensures up-to-date information is available to all stakeholders.
- **Robust Data Privacy:** Sensitive data is stored off-chain (e.g., in IPFS) with on-chain hash references to maintain data security.
- **Interoperability:** Designed to integrate with existing ERP, MES, and IoT systems for seamless data exchange.

---

## Architecture

The system is composed of:
- **Smart Contract (DIAMPartRecord.sol):** Implements the logic for creating and updating digital part records.
- **Front-End Application:** A web interface that allows users to interact with the blockchain (e.g., creating part records, adding events, querying history).
- **Back-End Integration:** Node.js scripts for monitoring blockchain events, processing data, and interfacing with decentralized storage (IPFS).
- **Blockchain Network:** Deployed on a private or test Ethereum network (e.g., Ropsten) with support for permissioned operations.

---

## Installation

### Prerequisites
- Node.js (v14 or later) and npm or yarn
- Solidity compiler (v0.8.0 or later); available via Remix IDE, Truffle, or Hardhat
- An Ethereum wallet (e.g., MetaMask) for blockchain interactions

### Steps
1. **Clone the Repository**
    ```bash
    git clone https://github.com/raddadalmaayn/DIAM-Part-Record.git
    cd DIAM-Part-Record
    ```
2. **Install Dependencies**
    ```bash
    npm install
    ```
3. **Compile the Smart Contract**
   - Open `DIAMPartRecord.sol` in [Remix IDE](https://remix.ethereum.org) or use Truffle/Hardhat.
   - Ensure the compiler version matches the contract’s pragma.
4. **Deploy the Contract**
   - Deploy the smart contract on a local blockchain (e.g., Ganache) or a test network (e.g., Ropsten).

---

## Usage

### Front-End Interaction
- Open the provided `index.html` (or your custom front-end app) in your browser.
- Connect your wallet (e.g., MetaMask) to the appropriate network.
- Use the interface to:
  - Create new part records.
  - Log production events.
  - Query the blockchain for part history.

### Back-End Scripts
- Run Node.js scripts (e.g., `monitor.js`) to listen for blockchain events and automate data processing:
    ```bash
    node monitor.js
    ```

---

## Development

- **Smart Contract:** Modify `DIAMPartRecord.sol` as needed and recompile using your preferred development environment.
- **Front-End:** Edit the JavaScript files in the `src/` directory to adjust the user interface or functionality.
- **Testing:** Use local test networks (e.g., Ganache) and frameworks like Truffle or Hardhat to run tests on your contract.

---

## License



---

## Contact

For more information or collaboration opportunities, please contact:

-

