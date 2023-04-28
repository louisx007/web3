// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "forge-std/console.sol";

contract Bank {
    mapping(address => uint256) amounts;
    uint256 totalAmount;
    address  owner;

    constructor() {
        owner = msg.sender;
    }

    function deposit()  public payable returns(uint256){
        console.log("address = %s,value = %s",msg.sender,msg.value);
        amounts[msg.sender] += msg.value;
        return amounts[msg.sender];
    }

    function withdraw(uint256 amount) public payable {
        require(amounts[msg.sender] >= amount,"Insufficient balance");
        require(msg.value == 0);
        payable(msg.sender).transfer(amount);
        amounts[msg.sender] -= amount;
    }

    function balanceOf(address addr) public view returns(uint256) {
        console.log("address",addr);
        return amounts[addr];
    }

    receive()  external payable {
        totalAmount  += msg.value;
    }

    function getTotalAmount() public view returns(uint256)  {
        console.log("totalAmount : ",totalAmount);
        return totalAmount;
    }


    function withdrawAll() public payable {
        require(msg.value == 0);
        require(msg.sender == owner);
        payable(owner).transfer(address(this).balance);
    }
}