// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Script.sol";
import "../src/Lending.sol";

contract BorrowTokens is Script {
    // Replace with your LendingContract address
    address constant LENDING_CONTRACT = 0xac77B823b58873572937a01b3E0CB9C417Cf637E;

    // Amount to borrow (adjust decimals as needed for the deposit token)
    uint256 constant BORROW_AMOUNT = 50 * 10 ** 6; // 50 USDC, assuming 6 decimals

    function run() external {
        
        vm.startBroadcast();

        // Borrow tokens from the LendingContract
        LendingContract(LENDING_CONTRACT).borrow(BORROW_AMOUNT);
        console.log("Borrowed tokens:", BORROW_AMOUNT);

        // Stop broadcast
        vm.stopBroadcast();
    }
}
