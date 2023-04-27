// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Counter.sol";
import "./BaseScript.sol";

contract CounterScript is BaseScript {

    function run() public {
        Counter c = new Counter();
        console.log("counter = %s",address(c));
    }
}