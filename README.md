# SendMeSong/

FUNCTIONALITIES  

Only the contract creator can pass the song name to the contract. 
The song buyer needs to pay ETH 0,001 to know the secret song.

Once the transfer checks out, the contract creates a no-value input-only transaction disclosing the song title and artist in hex bytes. 

The buyer receives the transaction in the wallet, and can check the hash with the song name on EtherScan.io.

It's not possible to buy the song more than once.
