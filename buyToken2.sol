pragma solidity 0.5.11;

contract MyContract {
    mapping(address => uint) public balances;
    address payable wallet;
    
    event Purchase(
        address indexed _buyer,
        uint _amount
        );
    
    constructor(address payable _wallet) public {
        wallet = _wallet;
    }
    
    function() external payable{
        buyToken();
    }
    
    function buyToken() public payable {
        balances[msg.sender] += 1;
            // comprar um Token.
        wallet.transfer(msg.value);
            // enviar ether à wallet.
        emit Purchase(msg.sender, 1);
    }
}
