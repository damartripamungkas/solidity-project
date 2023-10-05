// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MyContract {
    constructor() {}

    function veryLowGasUsed(uint256 length) public view returns (uint256) {
        uint256 start = gasleft();
        for (uint256 index = 0; index < length; ) {
            unchecked {
                ++index;
            }
        }
        return start - gasleft();
    }

    function highGasUsed(uint256 length) public view returns (uint256) {
        uint256 start = gasleft();
        for (uint256 index = 0; index < length; index++) {}
        return start - gasleft();
    }
}
