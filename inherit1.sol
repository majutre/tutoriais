pragma solidity 0.5.11;

contract tokenParent {
    string public name;
    mapping(address => uint) public balances;
    
    function mint() public {
        balances[tx.origin] ++;
    }
}

contract MyToken is tokenParent {
    string public name = "My Token";
}
