// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title Smart Contract Raffle
 * @author Pravin Selvarajah
 * @notice This contract is a simple raffle contract that allows users to enter a raffle and win a prize.
 */

contract Raffle {
    uint256 private immutable i_entranceFee;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {}


    function pickWinner() public {}


    /** Getter Functions */
    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    
}
