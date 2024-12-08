// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import "../src/SwapMaker.sol";

contract Deploy is Script {
    function run() external {
    
        vm.startBroadcast();

        address tokenA = 0x73e8E00646e7DE7f135AAE385A2102fd1637d59e;
        address tokenB = 0x58CCF12593D608D871EF447d3fEC9D00f35E14E2;

        SwapContractWithYield swapContract = new SwapContractWithYield(tokenA, tokenB);
        console.log("SwapContractWithYield deployed at:", address(swapContract));

        vm.stopBroadcast();
    }
}
