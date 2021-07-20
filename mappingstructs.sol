//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract MappingsStructExample {
    
    mapping(address => uint) balanceForAddress;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendMoney() public payable {
        balanceForAddress[msg.sender] += msg.value;
    }

    function withdrawAllMoney(address payable _to) public {
        _to.transfer(address(this).balance);
    }
    
    function withdrawMyMoney() public {
        require(balanceForAddress[msg.sender] > 0, "You have no money deposited on that smart contract!");
        balanceForAddress[msg.sender] = 0;
        payable(msg.sender).transfer(balanceForAddress[msg.sender]);
    }
}