// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/// @title Send money to a master account and receive the name of a song.
/// @author Alberto Olias Ibor
/// @notice This contract can by only used to retreive the song set by the contract owner.
contract SendMeSong {
    address payable public owner;
    string private songName;
    uint private songPrice;

    struct Buyer {
        bool purchased;
    }

    mapping (address => Buyer) buyers;

    receive() external payable {}

    constructor() {
        owner = payable(msg.sender);
    }

    function setSong(string memory _songName) public {
        require(msg.sender == owner);
        songName = _songName;
    }

    function buySong (address _buyer) public returns(string memory) {
        Buyer storage buyer = buyers[msg.sender];
        require(!buyers[_buyer].purchased, "You already purchased this song!");
        // Code to check that the 0.001ETH was sent
        buyer.purchased = true;
        return songName;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner, "You're not the owner of this contract.");
        _;
    }

     function getBalance() public view onlyOwner returns (uint) {
        return address(this).balance;
    }

    function sendToOwner() public payable onlyOwner {
        bool sent = owner.send(msg.value);
        require(sent, "Failed to sent funds.");
    }

}

/** FUNCTIONALITIES
 * Only the contract creator can pass the song name to the contract. 
 * The song buyer needs to pay ETH 0,001 to know the secret song.
 * Once the transfer checks out, the contract creates a no-value 
 * input-only transaction disclosing the song title and artist in hex bytes.
 * 
 * The buyer receives the transaction in the wallet, 
 * and can check the hash with the song name on EtherScan.io.
 * 
 * It's not possible to buy the song more than once.
 */