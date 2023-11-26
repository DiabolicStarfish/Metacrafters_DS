// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    // In-game items
    struct InGameItem {
        uint256 id;
        string name;
        uint256 price;
    }
    InGameItem[] public inGameItems;
    mapping(address => uint256[]) public inventory;
    
    constructor() ERC20("Degen", "DGN") {
        _mint(msg.sender, 50000000);

        inGameItems.push(InGameItem(0, "Health Potion", 50));
        inGameItems.push(InGameItem(1, "Doran's Blade", 450));
        inGameItems.push(InGameItem(2, "Doran's Shield", 450));
        inGameItems.push(InGameItem(3, "Corrupting Potion", 500));
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

    // Check token balance of an address.
    function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    // Redeem tokens for in-game items.
    function redeemForItem(uint256 itemId) public {
        require(itemId < inGameItems.length, "DegenToken: Invalid item ID");

        InGameItem storage item = inGameItems[itemId];
        require(balanceOf(msg.sender) >= item.price, "DegenToken: Insufficient balance");

        inventory[msg.sender].push(itemId);

        _burn(msg.sender, item.price);
    }

    // Check the inventory of an address.
    function checkInventory(address account) public view returns (uint256[] memory) {
        return inventory[account];
    }
    
}
