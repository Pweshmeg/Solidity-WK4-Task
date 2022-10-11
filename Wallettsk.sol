//SPDX-License-Identifier: MIT

pragma solidity >= 0.7.0 < 0.9.0;

contract WalletApp{

    address payable public owner;
    uint public balance;

    // Events
    event deposit(address _addr, uint _amount);
    event send(address _addr, uint _amount);


    // Modifier
    
    modifier  containsEnough(address _addr, uint _amount){
    require (balances [_addr] >= _amount, "insufficient funds");
    _;
    }

    // Mapping called Balances
    mapping (address => uint) public balances;

    
    // Receive Function
    receive() external payable{
    balances[msg.sender] += msg.value;
    emit deposit (msg.sender, msg.value);
    }

    
    // Send Function
    function Send(address _receiver, uint _amount) external containsEnough(msg.sender, _amount){
    balances[_receiver] += _amount;
    balances [msg.sender] -= _amount;
    emit send (_receiver, _amount);
    }


}