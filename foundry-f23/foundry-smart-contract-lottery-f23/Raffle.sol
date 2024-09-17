/* ------------------------------------------ */
// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions
/* ------------------------------------------ */
// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// internal & private view & pure functions
// external & public view & pure functions
/* ------------------------------------------ */

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title A sample Raffle contract
/// @author Pravin Selvarajah
/// @notice This contract is for creating a sample raffle 
/// @dev Implements Chainlink VRFv2.5

contract Raffle {
    /* Errors */
    error Raffle__SendMoreToEnterRaffle();

    uint256 private immutable i_entranceFee;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    } 
    
    function enterRaffle() public payable {
        // First Iteration -> require(msg.value >= i_entranceFee, "Not enough ETH sent!");
        // Update to error handling:
        if (msg.value < i_entranceFee){
            revert Raffle__SendMoreToEnterRaffle();
        }
        // Latest Update in latest solidity update with
        //require(msg.value >= i_entranceFee, SendMoreToEnterRaffle());


    }

    function pickWinner() public {}


    /** Getter Functions **/
    function getEntranceFee() external view returns(uint256) {
        return i_entranceFee;
    }

}