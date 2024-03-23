// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FundMe {
    
    uint256 public minimumUsd = 5;
    function fund() public payable {
        require(msg.value >= minimumUsd);
    }

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    address public immutable i_owner;

    constructor()  {
        i_owner = msg.sender;
    }

    function withdraw() public onlyOwner {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // reset the array
        funders = new address[](0);
        // withdraw the funds

        // get the balance of the contract
        // msg.sender = address
        // payable(msg.sender) = payable address
        
        // // transfer
        // payable(msg.sender).transfer(address(this).balance);

        // // send
        // bool sendSuccess = payable(msg.sender).transfer(address(this).balance);
        // require(sendSuccess, "Send failed");

        // call - lower level command
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner() {
        require(msg.sender == i_owner, "Sender is not owner!");
        _;
    }

}



/* 

NOTES

- What is a revert?
    - Undo any actions that have been done, and send hte remaining gas back
- Remember that smart contracts are unable to connect with external systems which is why Oracles solve a huge problem in the crypto ecosystem.

- Whenever you interact with a contract you need the contract's address & ABI
- With Solidity, you always want to MULTIPLY then DIVIDE.

- A library embedded into the contract if all library functions are internal. Otherwise the library must be deployed and then linked before the contract is deployed.


- Constant and Immutable variables help reduce the total gas consumption of your smart contract. If there are variables that won't change, it is better to use these keywords to keep the smart contract cost low.
- For constant variables, you want to name the variable ALL CAPS.

Advice from Patrick: GO FOR GAS OPTIMIZATION ONCE YOU'RE REALLY GOOD

- Variables that we set one time but outside the same line that they are declared, we set them for example in the constructor, we can name them immutable


*/
