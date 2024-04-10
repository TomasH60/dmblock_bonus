// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Storage {
    mapping(string => uint) private state;
    string[] private listOfItems;
    address[] private allowedAddresses;
    address private owner;

    modifier onlyAllowed() {
        require(isAllowed(msg.sender), "Caller is not allowed");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    constructor(address[] memory _addresses) {
        allowedAddresses = _addresses;
        owner = msg.sender; 
    }

    function getStateOfItem(string memory _name) public onlyAllowed view returns (uint) {
        require(contains(_name), "Item not in storage");
        return state[_name];
    }

    function setStateOfItem(string memory _name, uint _amount) public onlyAllowed returns (bool) {
        require(_amount > 0, "Amount of item needs to be more than 0");
        if (!contains(_name)) {
            listOfItems.push(_name);
        }
        state[_name] = _amount;
        return true;
    }

    function removeItem(string memory _name) public onlyAllowed returns (bool) {
        require(contains(_name), "Item not in storage");
        removeFromArray(_name);
        return true;
    }

    function removeFromArray(string memory _name) private onlyAllowed {
        for (uint i = 0; i < listOfItems.length; i++) {
            if (keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked(listOfItems[i]))) {
                listOfItems[i] = listOfItems[listOfItems.length - 1];
                listOfItems.pop();
                delete state[_name];
                return;
            }
        }
    }

    function contains(string memory _name) private view returns (bool) {
        for (uint i = 0; i < listOfItems.length; i++) {
            if (keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked(listOfItems[i]))) {
                return true;
            }
        }
        return false;
    }

    function isAllowed(address _address) private view returns (bool) {
        for (uint i = 0; i < allowedAddresses.length; i++) {
            if (_address == allowedAddresses[i]) {
                return true;
            }
        }
        return false;
    }

    function addAllowedAddress(address _address) public onlyOwner {
        require(!isAllowed(_address), "Address is already allowed");
        allowedAddresses.push(_address);
    }

    function removeAllowedAddress(address _address) public onlyOwner {
        require(isAllowed(_address), "Address is not allowed");
        for (uint i = 0; i < allowedAddresses.length; i++) {
            if (allowedAddresses[i] == _address) {
                allowedAddresses[i] = allowedAddresses[allowedAddresses.length - 1];
                allowedAddresses.pop();
                break;
            }
        }
    }
}
