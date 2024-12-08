// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import "../src/Lending.sol";

contract DeployLendingContract is Script {
    function run() external {
        // Define LP token and deposit token addresses
        address lpToken = 0xe71EAE89Dd7B325d5998C82D48d71Ff7A4c8E322;
        address usdcToken = 0xbe5d45A7c0709BAb9e51337c991daBCB97c6d1eF;

        // Start broadcast
        vm.startBroadcast();

        // Deploy the Lending Contract
        LendingContract lendingContract = new LendingContract(lpToken, usdcToken);

        console.log("Lending Contract deployed at:", address(lendingContract));

        vm.stopBroadcast();
    }
}
