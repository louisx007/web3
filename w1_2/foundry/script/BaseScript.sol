// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
contract BaseScript is Script {

    address deployer;
    string  mnemonic;
    uint256 privateKey;

    function setUp() public {
        mnemonic =  vm.envString("mnemonic");
        (deployer, privateKey) = deriveRememberKey(mnemonic,0);
        vm.startBroadcast(privateKey);
    }

}