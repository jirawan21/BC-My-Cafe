pragma solidity ^0.5.1;

contract ProofOfOrder {  

  mapping (bytes32 => bool) private listOrder;

  //---events---
  event OrderAdded(
    address from,   
    string text,
    bytes32 hash
  );
  
  event RegistrationError(
    address from,
    string text,
    string reason
  );

  // store the proof for a order in the contract state
  function recordProof(bytes32 proof) private {
    listOrder[proof] = true;
  }
  
  // record a order name
  function registration(string memory name) public payable {
    

    if (msg.value != 0.03 ether) {
        //---fire the event---
        emit RegistrationError(msg.sender, name, 
            "Incorrect amount of Ether. 0.01 ether for registration");
        
        //---refund back to the sender---
        msg.sender.transfer(msg.value);
        
        //---exit the function---
        return;
    }
 
    recordProof(hashing(name));
    
    //---fire the event---
    emit OrderAdded(msg.sender, name, 
        hashing(name));
    
  }
  
  function registration2(string memory name) public payable {
    

    if (msg.value != 0.05 ether) {
        //---fire the event---
        emit RegistrationError(msg.sender, name, 
            "Incorrect amount of Ether. 0.05 ether for registration");
        
        //---refund back to the sender---
        msg.sender.transfer(msg.value);
        
        //---exit the function---
        return;
    }
 
    recordProof(hashing(name));
    
    //---fire the event---
    emit OrderAdded(msg.sender, name, 
        hashing(name));
    
  }
  
   function registration3(string memory name) public payable {
    

    if (msg.value != 0.02 ether) {
        //---fire the event---
        emit RegistrationError(msg.sender, name, 
            "Incorrect amount of Ether. 0.02 ether for registration");
        
        //---refund back to the sender---
        msg.sender.transfer(msg.value);
        
        //---exit the function---
        return;
    }
 
    recordProof(hashing(name));
    
    //---fire the event---
    emit OrderAdded(msg.sender, name, 
        hashing(name));
    
  }
  
  function registration4(string memory name) public payable {
    

    if (msg.value != 0.01 ether) {
        //---fire the event---
        emit RegistrationError(msg.sender, name, 
            "Incorrect amount of Ether. 0.01 ether for registration");
        
        //---refund back to the sender---
        msg.sender.transfer(msg.value);
        
        //---exit the function---
        return;
    }
 
    recordProof(hashing(name));
    
    //---fire the event---
    emit OrderAdded(msg.sender, name, 
        hashing(name));
    
  }
  
  
  // SHA256 for Integrity
  function hashing(string memory name) private 
  pure returns (bytes32) {
    return sha256(bytes(name));
  }
  

}