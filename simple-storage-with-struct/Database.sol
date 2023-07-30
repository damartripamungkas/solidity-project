// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MyContract {
    struct FormatData {
        string name;
        string country;
        uint256 updateAt;
        uint256 createdAt;
    }

    mapping (address => FormatData) private Database;
    constructor() {}

    function getData(address owner) public view returns (FormatData memory) {
        return Database[owner];
    }

    function createData(string memory name, string memory country) public returns (bool) {
        FormatData memory myData = getData(msg.sender);
        require(myData.createdAt == 0, "contract: data already exists");
        myData.name = name;
        myData.country = country;
        myData.updateAt = block.timestamp;
        myData.createdAt = block.timestamp;
        Database[msg.sender] = myData;
        return true;
    }

    function updateData(string memory name, string memory country) public returns (bool) {
        FormatData memory myData = getData(msg.sender);
        require(myData.createdAt != 0, "contract: data doesn't exist");
        myData.name = name;
        myData.country = country;
        myData.updateAt = block.timestamp;
        Database[msg.sender] = myData;
        return true;
    }
}