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
    // @dev the duration of the lottery in seconds
    uint256 private immutable i_interval;
    address payable[] private s_players;
    uint256 private s_lastTimeStamp;

    /* Events */
    event RaffleEntered(address indexed player);

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    } 
    
    function enterRaffle() external payable {
        // First Iteration -> require(msg.value >= i_entranceFee, "Not enough ETH sent!");
        // Update to error handling:
        if (msg.value < i_entranceFee){
            revert Raffle__SendMoreToEnterRaffle();
        }
        // Latest Update in latest solidity update with
        //require(msg.value >= i_entranceFee, SendMoreToEnterRaffle());
        s_players.push(payable(msg.sender));
        // Rule of thumb: emit an event whenever we update a storage variable
        // Two reasons why people would work with events:
        //      1. Makes migration easier
        //      2. Makes front end "indexing" easier
        emit RaffleEntered(msg.sender);
    }
    // 1. Get a random number
    // 2. Use the random number to pick a s_players
    // 3. Be automatically called
    function pickWinner() external {
        // check to see if enough time has passed
        if ((block.timestamp - lastTimeStamp) < i_interval) {
            revert();
        }

        
    }


    /** Getter Functions **/
    function getEntranceFee() external view returns(uint256) {
        return i_entranceFee;
    }
}