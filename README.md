# 💰 Simple Decentralized Donation Pool on Base

This repository contains the deployment information and interaction guides for a **Simple Decentralized Donation Pool** smart contract deployed on the Base network. This contract enables anyone to donate ETH transparently and allows a designated beneficiary to securely withdraw all collected funds.

## 🛠️ Project Summary

| Detail | Value |
| :--- | :--- |
| **Network** | **Base Mainnet** |
| **Contract Address (CA)** | `0xDa440463D0c1F578108EBcB3844113556b3D14b2` |
| **Deployer Address (Owner)** | `0x2A6b5204B83C7619c90c4EB6b5365AA0b7d912F7` |
| **Beneficiary Address** | `0x2A6b5204B83C7619c90c4EB6b5365AA0b7d912F7` |
| **Verification Link** | [View on BaseScan](https://basescan.org/address/0xDa440463D0c1F578108EBcB3844113556b3d14b2) |

---

## 🚀 Interaction Guide: Generating 10+ Unique Transactions

This contract is highly efficient for generating unique on-chain transactions because the donation process is simple and passive.

### 1. Donating (Generating Unique TX)

Any user can generate a unique transaction by simply **sending ETH** (as little as $0.000001 \text{ ETH}$) to the contract address. No function calls or dApps are required.

| Step | Action | Wallet Used |
| :--- | :--- | :--- |
| **1.** | Open your crypto wallet (MetaMask, Coinbase Wallet, etc.). | Any Donor Wallet |
| **2.** | Select **Send** ETH on the Base network. | |
| **3.** | Enter the **Contract Address** (`0xDa440463D0c1F578108EBcB3844113556b3D14b2`) as the recipient. | |
| **4.** | Enter the desired **ETH amount** (e.g., `0.000001`). | |
| **5.** | Confirm the transaction. | |
| **Result:** | **Each distinct wallet sending ETH creates one unique transaction** recorded via the contract's `receive()` function. |

### 2. Withdrawing Funds (Beneficiary Action)

Only the **Beneficiary** (`0x2A6b5204B83C7619c90c4EB6b5365AA0b7d912F7`) can perform this action.

| Function | Description | Method |
| :--- | :--- | :--- |
| **`withdrawAllFunds()`** | Transfers the entire collected ETH balance from the contract to the Beneficiary's wallet. | The Beneficiary must call this function via BaseScan or a DApp interface. |

### 3. Administrative Action (Owner Action)

| Function | Description | Wallet Used |
| :--- | :--- | :--- |
| **`setBeneficiary(address payable newBeneficiary)`** | Allows the **Owner** (`0x2A6b5204...`) to change the withdrawal destination (beneficiary) if necessary. | Owner Wallet |

---

## ⚙️ Compile and Verification Details

| Detail | Specification |
| :--- | :--- |
| **Solidity Compiler Version** | `0.8.30` |
| **Contract Name** | `SimpleDonationPool` |
| **Constructor Arguments** | The **Beneficiary Address** (`0x2A6b5204B83C7619c90c4EB6b5365AA0b7d912F7`) |
| **Optimization** | Enabled (Recommended) |
