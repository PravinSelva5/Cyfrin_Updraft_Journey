// SPDX-License-Identifier: MIT

pragma solidity >=0.8.19; // stating our version

contract SimpleStorage {
    uint256 favouriteNumber;

    struct Person {
        uint256 favouriteNumber;
        string name;
    }
    // dynamic array
    Person [] public listOfPeople;
    mapping (string => uint256) public nameToFavouriteNumber;

    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;        
    }

    // view, pure
    function retrieve() public view returns(uint256) {
        return favouriteNumber;
    }

    // calldata, memory, storage
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        listOfPeople.push( Person(_favouriteNumber, _name));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }

}

/*
-------
 NOTES
-------
Functions can have 4 visibility specifiers assigned to them

    1. public: visible externally and internally
    2. private: only visible in the current contract
    3. external: only visible externally
    4. internal: only visible internally

Remember, you pay gas when you change the state of the blockchain.
When using pure or view, you don't pay gas for that.
But if another function that does update state, calling a view or pure function will cost gas.
EVM can access and store information in six places:

    1. Stack
    2. Memory
    3. Storage
    4. Calldata
    5. Code
    6. Logs

- For calldata and memory, the variable will only exist temporarily during the function call
- If you pass a memory variable to a function, it can be changed/manipulated. However, with calldata you can't manipulate/modify the variable
- Even though calldata is a temp variable, it can't be modified
- For dynamic arrays, structs, strings, and mappings you can use the memory type.

*/