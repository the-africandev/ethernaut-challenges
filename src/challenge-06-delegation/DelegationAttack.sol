// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IDelegation {
    function pwn() external;
}

contract DelegationAttack {
    address public owner;

    address public target;

    constructor(address _target) {
        target = _target;
    }

    function attack() external {
        // (bool success, ) = target.delegatecall(
        //     abi.encodeWithSignature("pwn()")
        // );
        // require(success, "delegatecall failed");
        // sendTransaction({
        //     from: msg.sender,
        //     to: target,
        //     data: abi.encodeWithSignature("pwn()")
        // });
    }
}
