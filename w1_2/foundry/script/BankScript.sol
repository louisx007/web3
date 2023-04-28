// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Bank.sol";
import "./BaseScript.sol";

contract BankScript is BaseScript {

    function run() public {
        Bank bank = new Bank();
        console.log("counter = %s",address(bank));
    }
}