// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;


contract MySmartContract {

    // public variables here
    string public tokenName = "Box";
    string public tokenAbbrv = "BX";
    uint public totalSupply = 0;

    // mapping variable here
    mapping(address => uint) public balances;
    // mint function
    function mint(address _address, uint _value) public {
        assert(_value > 0);
        if(_value > 10000) {
            revert("Value is too high. Only 10000 tokens can be minted at a time.");
        }
        totalSupply += _value;
        balances[_address] += _value;
    }
    // burn function
    function burn(address _address, uint _value) public {
        require(balances[_address] >= _value, "Not enough balance to burn");
        totalSupply -= _value;
        balances[_address] -= _value;
    }
} 
