// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

//import "hardhat/console.sol";

contract Assessment {
    address payable public owner;
    uint256 public balance;
    uint256 public totalSupply;

    event Deposit(uint256 amount);
    event Withdraw(uint256 amount);

    event Mint(uint256 amount);
    event Burn(uint256 amount);

    constructor(uint initBalance) payable {
        owner = payable(msg.sender);
        balance = initBalance;
        totalSupply = initBalance;
    }

    function getBalance() public view returns(uint256){
        return balance;
    }

    function deposit(uint256 _amount) public payable {
        uint _previousBalance = balance;

        // make sure this is the owner
        require(msg.sender == owner, "You are not the owner of this account");

        // perform transaction
        balance += _amount;

        // assert transaction completed successfully
        assert(balance == _previousBalance + _amount);

        // emit the event
        emit Deposit(_amount);
    }

    // custom error
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function withdraw(uint256 _withdrawAmount) public {
        require(msg.sender == owner, "You are not the owner of this account");
        uint _previousBalance = balance;
        if (balance < _withdrawAmount) {
            revert InsufficientBalance({
                balance: balance,
                withdrawAmount: _withdrawAmount
            });
        }

        // withdraw the given amount
        balance -= _withdrawAmount;

        // assert the balance is correct
        assert(balance == (_previousBalance - _withdrawAmount));

        // emit the event
        emit Withdraw(_withdrawAmount);
    }
    function mint(uint256 _amount) public {
        require(msg.sender == owner, "You are not the owner of this account");
        require(_amount >= 10, "Value is too low. Minimum 10 ETH can be minted at a time.");
        uint _previousBalance = balance;
        if (_amount > 100) {
            revert("Value is too high. Only 100 ETH can be minted at a time.");
        }

        // mint the given amount
        balance += _amount;
        totalSupply += _amount;

        // assert the balance is correct
        assert(balance == (_previousBalance + _amount));

        // emit the event
        emit Mint(_amount);
    }
    function burn(uint256 _amount) public {
        require(msg.sender == owner, "You are not the owner of this account");
        require(_amount >= 10, "Value is too low. Minimum 10 ETH can be burned at a time.");
        uint _previousBalance = balance;
        if (balance < _amount) {
            revert InsufficientBalance({
                balance: balance,
                withdrawAmount: _amount
            });
        }

        // burn the given amount
        balance -= _amount;
        totalSupply -= _amount;

        // assert the balance is correct
        assert(balance == (_previousBalance - _amount));

        // emit the event
        emit Burn(_amount);
    }
}
