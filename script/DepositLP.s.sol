// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import "../src/Lending.sol";
import "../lib/@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ApproveAndDeposit is Script {
    // Replace with your LendingContract, LP token, and USDC token addresses
    address constant LENDING_CONTRACT = 0xac77B823b58873572937a01b3E0CB9C417Cf637E;
    address constant LP_TOKEN = 0xe71EAE89Dd7B325d5998C82D48d71Ff7A4c8E322;
    address constant USDC_TOKEN = 0xbe5d45A7c0709BAb9e51337c991daBCB97c6d1eF;

    uint256 constant COLLATERAL_AMOUNT = 10 * 10 ** 18; // 10 LP tokens (adjust decimals as needed)
    uint256 constant DEPOSIT_AMOUNT = 100 * 10 ** 6; // 100 USDC (USDC has 6 decimals)

    function run() external {
        vm.startBroadcast();

        // Approve LP tokens for deposit
        IERC20(LP_TOKEN).approve(LENDING_CONTRACT, COLLATERAL_AMOUNT);
        console.log("Approved LP tokens for LendingContract");

        // Deposit LP tokens as collateral
        LendingContract(LENDING_CONTRACT).depositCollateral(COLLATERAL_AMOUNT);
        console.log("Deposited LP tokens as collateral");

        // Approve USDC tokens for deposit
        IERC20(USDC_TOKEN).approve(LENDING_CONTRACT, DEPOSIT_AMOUNT);
        console.log("Approved USDC tokens for LendingContract");

        // Deposit USDC tokens for lending
        LendingContract(LENDING_CONTRACT).deposit(DEPOSIT_AMOUNT);
        console.log("Deposited USDC tokens");

        // Stop broadcast
        vm.stopBroadcast();
    }
}
