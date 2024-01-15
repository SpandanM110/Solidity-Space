// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract ExampleMappingWithdrawals{

    mapping(address => uint) public balancedReceived;

    function sendMoney() public payable {
        balancedReceived[msg.sender] += msg.value;
    }

    function getbalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawAllMoney(address payable _to) public{
        uint balanceToSendOut = balancedReceived[msg.sender];
        balancedReceived[msg.sender] = 0;
        _to.transfer(balanceToSendOut);
    }
}