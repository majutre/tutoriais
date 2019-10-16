pragma solidity 0.5.11;

contract MyContract {
    mapping(address => uint) public balances;
    address payable wallet;
    
    constructor(address payable _wallet) public {
        wallet = _wallet;
    }
    
    function buyToken() public payable {
        balances[msg.sender] += 1;
            // comprar um Token.
        wallet.transfer(msg.value);
            // enviar ether à wallet.
        
    }
}
