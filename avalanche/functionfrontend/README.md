# Function Frontend Project


## Description

This project is about writing a simple contract that shows the value of the functions in a frontend application.

## Getting Started

### Executing program

#### Downloading the files
To run this program, you can need to clone from a git repository by [Metacrafter Chris](https://github.com/MetacrafterChris/SCM-Starter.git).

This repository has all the files needed to run the program.

After cloning the repository, you can open the files in an IDE of your choice. After that you need to replace the files "Assessment.sol" and "index.js" with the files in this repository.

#### Setting up the environment
Once you have all the files needed, you have to set the localhost for the program to run.

Here are the steps as follows:
1. Go to the folder of the repository that was downloaded using the terminal.
2. Type the command `npm i`
3. In a separate terminal, type the command `npx hardhat node`
4. In an another separate terminal, type the command `npx hardhat run --network localhost scripts/deploy.js`
5. In the first terminal, type the command `npm run dev`
6. Go to the browser and type `localhost:3000` in the address bar.

#### Setting up Metamask Wallet
This project requires the use of the Metamask Wallet. To download the Metamask Wallet, you can go to [Metamask](https://metamask.io/download.html). Or get the extension from the browser extension store.

To set up the Metamask Wallet, you need to follow these steps:
1. Click on the Metamask extension in the browser.
2. Click on the "Get Started" button.
3. Click on the "Import Wallet" button.
4. Click on the "Import using private key" button.
5. Paste the first private key from the terminal that was used to run the `npx hardhat node` command.
6. Click on the "Import" button.
7. Click on the "All Done" button.
8. Create a localhost network by clicking on the network dropdown menu.
9. Click on the "Add a network" button.
10. Type a network name of your choice in the "Network Name" text box.
11. Type the URL provided in the terminal in which `npx hardhat node` was executed, in the "New RPC URL" text box.
12. Type chain id `31337` in the "Chain ID" text box.
13. Type "ETH" in the "Currency Symbol" text box.
14. Click on the "Save" button.
15. Select a network for your account.

#### Executing the program
After typing `npm run dev` in the terminal, you can go to the browser and type `localhost:3000` in the address bar.

You can now interact with the program by clicking on the "Withdraw","Deposit","Mint", and "Burn" buttons.

Here are the steps to interact with the program:
1. Click on the "Deposit" button.
2. A pop-up will appear from Metamask. Click on the "Confirm" button.
3. Balance will increase by one.
4. Click on the "Withdraw" button.
5. A pop-up will appear from Metamask. Click on the "Confirm" button.
6. Balance will decrease by one.
7. Click on the "Mint" button.
8. A pop-up will appear from Metamask. Click on the "Confirm" button.
9. Balance will increase by 10.
10. Click on the "Burn" button.
11. A pop-up will appear from Metamask. Click on the "Confirm" button.
12. Balance will decrease by 10.

And that's it! You have successfully interacted with a simple contract on a frontend application.

## Authors

DiabolicStarfish <br>
[Dstarfish](https://github.com/DiabolicStarfish)