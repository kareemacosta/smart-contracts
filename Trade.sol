//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.9.0;

contract Trade {
    address payable public owner;
    address public buyer;
    uint public price;

    constructor() {
        owner = payable(msg.sender);
    }

    function setPrice(uint _price) public {
        require(msg.sender==owner, "Only owner can set price");
        price = _price;
    }

    function pay() external payable {
        require(msg.value == price, "value is not equal to the price");
        uint a = address(this).balance; //balance of smart contract
        a += msg.value;
        buyer = msg.sender;
    }

    function getBalance() public view returns(uint) {
        require(msg.sender == owner, "Only owner can check balance");
        return address (this).balance;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        owner.transfer(address(this).balance);
    }



}
