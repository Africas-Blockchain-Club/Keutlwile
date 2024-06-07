pragma solidity ^0.8.18;

// this smart contract is for the implemetation of crypto currency ,
// it , allows a user to create , mint new coins and then send them to other addresses 
contract mintingCoins{
    address public minter;
    mapping (address => uint) public balance;
    event send(address from , address to, uint amount);

    constructor() public {
        minter = msg.sender;
    }

    function mint(address receiver , uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balance [receiver] += amount ;
    }

    function sent(address receiver , uint amount) public {
        require(amount <= balance [msg.sender] , "Not enough funds." );
        balance[msg.sender] -= amount;
        balance[receiver] += amount ;
        emit send(msg.sender , receiver , amount);
    }
    
    function balances(address _account) external view returns (uint){
        return balance[_account];
    }

}