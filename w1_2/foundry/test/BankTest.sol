// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Bank.sol";

contract BankTest is Test {

    Bank public bank;

    function setUp() public {
        bank = new Bank();
    }

    function test_deposit(uint256 val) public {
        address addr = msg.sender;
        vm.startPrank(addr);
        vm.deal(addr, val);
        uint256 amount = bank.balanceOf(msg.sender);
        bank.deposit{value: val}();
        assertEq(bank.balanceOf(msg.sender), val + amount);
    }

//    function test_withdraw(uint256 val) public {
//        address addr = msg.sender;
//        vm.startPrank(addr);
//        vm.deal(addr, val);
//        uint256 amount = bank.balanceOf(msg.sender);
//        bank.deposit{value: val}();
//        assertEq(bank.balanceOf(msg.sender), val + amount);
//        bank.withdraw(val);
//        assertEq(bank.balanceOf(msg.sender), amount);
//    }

}
