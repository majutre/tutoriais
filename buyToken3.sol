pragma solidity 0.5.11;

contract tokenContract {
    string public name;
    mapping(address => uint) public balances;
    
    function mint() public {
        balances[tx.origin] ++;
        //       ^msg.sender aqui não funcionaria, pois no caso, o "sender" é o MyContract, não o remetente.
        //        tx.origin se refere SEMPRE à pessoa que fez a transação.
    }
}

contract MyContract {
    address payable wallet;
    address public token;
    
    constructor(address payable _wallet, address _token) public {
        wallet = _wallet;
        token = _token;
    }
    
    function() external payable{
        buyToken();
    }
    
    function buyToken() public payable {
        tokenContract _token = tokenContract(address(token));
        _token.mint();
        // é possível substituir as duas linhas de cima por tokenContract(address(token)).mint();
        wallet.transfer(msg.value);
          
    }
}
