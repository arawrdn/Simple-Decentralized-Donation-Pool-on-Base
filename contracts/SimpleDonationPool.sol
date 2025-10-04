// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30; 

contract SimpleDonationPool {
    
    address payable public beneficiary;
    address payable public owner; 

    // Constructor: Sets the deployer as the Owner and the designated beneficiary.
    // In this deployment, the Owner and Beneficiary are the same address.
    constructor(address payable _beneficiary) {
        owner = payable(msg.sender);
        beneficiary = _beneficiary;
        require(_beneficiary != address(0), "Beneficiary address cannot be zero.");
    }

    // Modifier to ensure only the designated beneficiary can call the function.
    modifier onlyBeneficiary() {
        require(msg.sender == beneficiary, "Only the beneficiary can perform this action.");
        _;
    }

    // --- FUNCTION 1: Donation Receiver ---
    // Automatically triggered when any wallet sends ETH directly to the contract address.
    receive() external payable {
        // Ensures the donation is greater than zero ETH (accepts amounts as low as 1 Wei, e.g., 0.000001 ETH).
        require(msg.value > 0, "Donation amount must be greater than zero.");
        // All deposited ETH is automatically added to the contract's balance.
    }

    // --- FUNCTION 2: Withdraw Funds (Only Beneficiary) ---
    // Allows the designated beneficiary (0x2A6b5204...) to withdraw the entire collected balance.
    function withdrawAllFunds() public onlyBeneficiary {
        uint256 balanceToWithdraw = address(this).balance;

        require(balanceToWithdraw > 0, "No funds available to withdraw.");

        // Transfer the entire collected balance to the beneficiary's address
        (bool success, ) = beneficiary.call{value: balanceToWithdraw}("");
        require(success, "ETH transfer to beneficiary failed.");
    }
    
    // Optional: Allows the owner (0x2A6b5204...) to change the beneficiary if needed.
    function setBeneficiary(address payable newBeneficiary) public {
        require(msg.sender == owner, "Only the owner can set a new beneficiary.");
        require(newBeneficiary != address(0), "New beneficiary address cannot be zero.");
        beneficiary = newBeneficiary;
    }
}
