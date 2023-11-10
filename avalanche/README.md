# Smart Contract Project


## Description

This project is about writing a smart contract that implements the require(), assert() and revert() statements.

## Getting Started

### Executing program

#### IDE to use
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

![Remix IDE](https://ethereum.github.io/remix-ide/remix_screenshot.png)

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., myToken.sol). Here is an example code:

```javascript
pragma solidity 0.8.18;

contract MyToken {

    string public tokenName = "Box";
    string public tokenAbbrv = "BX";
    uint public totalSupply = 0;

    mapping(address => uint) public balances;

    function mint(address _address, uint _value) public {
        totalSupply += _value;
        balances[_address] += _value;
    }

    function burn(address _address, uint _value) public {
        require(balances[_address] >= _value, "Not enough balance to burn");
        totalSupply -= _value;
        balances[_address] -= _value;
    }
} 

```

#### Compiling and deploying the contract
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile myToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "myToken" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the mint and burn function. 
1. Copy the account generated on the left-hand sidebar.
2. Paste the account in the address box of the 'burn' and 'mint'.
3. Mint some tokens to be burned by typing some value in the value text box below the address box. Click 'transact'.
4. Burn some tokens that have been minted. In this case there are no real world effects of burning, as this was only testing or simulation of the contract. Type some value below what balance you have, and click 'transact'. 

And that's it! You have successfully deployed and interacted with a smart contract.

## Authors

DiabolicStarfish <br>
[Dstarfish](https://github.com/DiabolicStarfish)