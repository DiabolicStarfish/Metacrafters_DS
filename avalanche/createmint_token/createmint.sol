// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Mtoken is ERC20, Ownable {
    // Mint initial supply to the contract owner
    constructor() ERC20("MintToken", "MTKN") Ownable(msg.sender) {
        _mint(msg.sender, 50000000);
    }

    // Mint new tokens to the specified address.
    function mint(address to, uint256 amount) public onlyOwner {
        // The destination address must not be the zero address.
        require(to != address(0), "Invalid address");

        // The minted amount must be greater than zero.
        require(amount > 0, "Mint amount must be greater than 0");

        _mint(to, amount);
    }

    // Burn tokens from the sender's balance.
    function burn(uint256 amount) public {
        // The amount to burn must be greater than zero.
        require(amount > 0, "Burn amount must be greater than 0");

        // The sender must have a sufficient balance.
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");

        _burn(msg.sender, amount);
    }

    // Transfer tokens from the sender to the specified recipient.
    function transfer(address to, uint256 amount) public override returns (bool) {
        // The destination address must not be the zero address.
        require(to != address(0), "Invalid recipient address");

        // The transfer amount must be greater than zero.
        require(amount > 0, "Transfer amount must be greater than 0");

        // The sender must have a sufficient balance.
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");

        _transfer(msg.sender, to, amount);

        return true;
    }
}
