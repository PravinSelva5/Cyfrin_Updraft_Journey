// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FundMe {
    
    uint256 public minimumUsd = 5;
    function fund() public payable {
        require(msg.vale >= minimumUsd)
    }

    function withdraw() public {
        
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
        
        // transfer
        payable(msg.sender).transfer(address(this).balance);

        // send
        bool sendSuccess = payable(msg.sender).transfer(address(this).balance);
        require(sendSuccess, "Send failed");


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

*/
