// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract EarCryptoCoin {

    address owner;
    string ticker = "EAR";
    uint limit = 10;

    mapping(address => uint ) balances;

    constructor(){
        owner = msg.sender;
    }
     
    function send(address _receiver, uint _amout ) public {
        require(_amout < balances[msg.sender], "You dont have enough EAR to be send.");
        balances[msg.sender] -= _amout;
        balances[_receiver] += _amout;
    }

    function mint(address _receiver, uint _amout ) public {
        require(msg.sender == owner, "You are not the owner.");
        limit +=_amout;
        balances[_receiver] = _amout;
    }

    function burn(address _receiver, uint _amout ) public {
        require(msg.sender == owner, "You are not the owner.");
        require(_amout > balances[_receiver], "The user havent have enough EAR coint");
        limit -=_amout;
        balances[_receiver] = _amout;
    }
}
