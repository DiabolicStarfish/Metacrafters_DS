import { useState, useEffect } from "react";
import { ethers } from "ethers";
import atm_abi from "../artifacts/contracts/Assessment.sol/Assessment.json";

export default function HomePage() {
    const [ethWallet, setEthWallet] = useState(undefined);
    const [account, setAccount] = useState(undefined);
    const [atm, setATM] = useState(undefined);
    const [balance, setBalance] = useState(undefined);

    const contractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
    const atmABI = atm_abi.abi;

    const getWallet = async () => {
        if (window.ethereum) {
            setEthWallet(window.ethereum);
        }

        if (ethWallet) {
            const account = await ethWallet.request({ method: "eth_accounts" });
            handleAccount(account);
        }
    };

    const handleAccount = (account) => {
        if (account) {
            console.log("Account connected: ", account);
            setAccount(account);
        } else {
            console.log("No account found");
        }
    };

    const connectAccount = async () => {
        if (!ethWallet) {
            alert("MetaMask wallet is required to connect");
            return;
        }

        const accounts = await ethWallet.request({
            method: "eth_requestAccounts",
        });
        handleAccount(accounts);

        // once wallet is set we can get a reference to our deployed contract
        getATMContract();
    };

    const getATMContract = () => {
        const provider = new ethers.providers.Web3Provider(ethWallet);
        const signer = provider.getSigner();
        const atmContract = new ethers.Contract(
            contractAddress,
            atmABI,
            signer
        );

        setATM(atmContract);
    };

    const getBalance = async () => {
        if (atm) {
            setBalance((await atm.getBalance()).toNumber());
        }
    };

    const deposit = async () => {
        if (atm) {
            let tx = await atm.deposit(1);
            await tx.wait();
            getBalance();
        }
    };

    const withdraw = async () => {
        if (atm) {
            let tx = await atm.withdraw(1);
            await tx.wait();
            getBalance();
        }
    };

    const withdrawAll = async () => {
        if (atm) {
            let tx = await atm.withdrawAll(1);
            await tx.wait();
            getBalance();
        }
    };

    const initUser = () => {
        // Check to see if user has Metamask
        if (!ethWallet) {
            return <p>Please install Metamask in order to use this ATM.</p>;
        }

        // Check to see if user is connected. If not, connect to their account
        if (!account) {
            return (
                <button className="btn" onClick={connectAccount}>
                    Please connect your Metamask wallet
                </button>
            );
        }

        if (balance == undefined) {
            getBalance();
        }

        return (
            <div className="flex-col items-center justify-center">
                <h6 className="flex justify-center font-black text-4xl">
                <p>BALANCE:</p>{balance}
                </h6>
                <h6 className="flex justify-left font-black">
                Account:
                </h6>
                <h6 className="mt-2 mb-5 border-2 border-neutral-600 border-neutral-500 p-1 text-xs">
                    {account}
                </h6>
                <div className="flex items-center">
                    <button className="btn m-1" onClick={deposit}>
                        Deposit 1
                    </button>
                    <button className="btn m-1" onClick={withdraw}>
                        Withdraw 1
                    </button>
                    <button className="btn m-1" onClick={withdrawAll}>
                        Withdraw All
                    </button>
                </div>
            </div>
        );
    };

    useEffect(() => {
        getWallet();
    }, []);

    return (
        <main className="flex bg-black items-center justify-evenly">
            <script src="https://cdn.tailwindcss.com"></script>

            <div className="grid grid-cols-2 gap-64">
                <section className="col-span-1 h-screen flex justify-center items-center">
                    {initUser()}
                </section>
            </div>
            <style jsx>
                {`
                    * {
                        font-family: "Arial Black";
                        color: white;
                        
                    }
                    
                    .container {
                        text-align: center;
                    }
                `}
            </style>
        </main>
    );
}