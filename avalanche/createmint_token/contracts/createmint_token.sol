// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract Mtoken is ERC20Capped, ERC20Burnable{
    address payable public owner;
    uint256 public blockPrize;
    constructor(uint256 cap, uint prize) ERC20("MintToken", "MTKN") ERC20Capped(cap * (10 ** decimals())) {
        owner = payable(msg.sender);
        _mint(owner, 50000000 * (10 ** decimals()));
        blockPrize = prize * (10 ** decimals()); 
    }

    function _mint(address to, uint256 amount) internal virtual override(ERC20, ERC20Capped) {
        require(totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        super._mint(to, amount);
    }

    function _burn(address to, uint256 amount) internal virtual override(ERC20, ERC20Burnable) {
        super._burn(to, amount);
    }

    function _mintPrize() internal {
        _mint(block.coinbase, blockPrize);
    }


    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override(ERC20, ERC20Capped) {
        require(from != address(0) && to != block.coinbase && block.coinbase != address(0), "Invalid transaction");
        _mintPrize();
        super._beforeTokenTransfer(from, to, amount);
    }

    function setBlockPrize(uint256 prize) public {
        require(msg.sender == owner, "Only owner can set block prize");
        blockPrize = prize * (10 ** decimals());
    }

    function destroy() public {
        require(msg.sender == owner, "Only owner can destroy");
        selfdestruct(owner);
    }

}
