/*
Assessment Requirements
1. Create a variable that can hold a number of NFT's. What type of variable might this be?
2. Create an object inside your mintNFT function that will hold the metadata for your NFTs. 
   The metadata values will be passed to the function as parameters. When the NFT is ready, 
   you will store it in the variable you created in step 1
3. Your listNFTs() function will print all of your NFTs metadata to the console (i.e. console.log("Name: " + someNFT.name))
4. For good measure, getTotalSupply() should return the number of NFT's you have created
*/

// create a variable to hold your NFT's
const holdNFT = ["happyOgre", "sadEmu", "angryApe"];
// this function will take in some values as parameters, create an
// NFT object using the parameters passed to it for its metadata, 
// and store it in the variable above.
function mintNFT (referenceId,nftName,index) {
    holdNFT[index] = {
        id : referenceId,
        name: nftName
    };
}

// create a "loop" that will go through an "array" of NFT's
// and print their metadata with console.log()
function listNFTs () {
    if(holdNFT[0].id != undefined && holdNFT[1].id != undefined && holdNFT[2].id != undefined){
        for(let i = 0; i<holdNFT.length; i++){
            console.log(holdNFT[i].id);
            console.log(holdNFT[i].name);
        }
    }else{
        console.log("There are no NFTs to list.");
    }
}

// print the total number of NFTs we have minted to the console
function getTotalSupply() {
    if(holdNFT[0].id == null && holdNFT[1].id == null && holdNFT[2].id == null){
        console.log("There are no minted NFTs.");
    }else{
        for(let i = 0; i<holdNFT.length; i++){
            console.log(holdNFT[i]);
        }
    }
}

// call your functions below this line
mintNFT("00", "George",0);
mintNFT("01", "John",1);
mintNFT("02", "Bob",2);

listNFTs();

getTotalSupply();
