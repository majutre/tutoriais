/*
State Mutability (só para FUNÇÕES):

VIEW: não modifica estados.
PURE: não lê e não modifica estados.
PAYABLE: podem receber/transferir ether.
*/

//VIEW FUNCTIONS

    /*
    NÃO PODEM:
    - escrever state variables;
    - criar outros contratos;
    - utilizar selfDestruct;
    - enviar ether;
    - chamar qualquer função que não seja view ou pure;
    - utilizar low-level calls (?);
    - inline assembly que contenha certos opcodes (wtf).
    */
    
pragma solidity 0.5.12;

contract C {
    function f(uint a, uint b) public view returns (uint){
        return a * (b + 42) + now;
    }
}

//PURE FUNCTIONS
    
    /*
    NÃO PODEM:
    - ler state variables;
    - acessar this.balance ou <endereço>.balance;
    - acessar membros do block, tx ou msg (exceto msg.sig e msg.data);
    - chamar qualquer função que não seja pure;
    - inline assembly que contenha certos opcodes (wtf).
    */
    
pragma solidity 0.5.12;

contract SampleContract {
    
    function func1(uint x, uint y) private pure returns (uint){
        return x * (y + 42);
    }
    function func2(uint a) private pure returns (uint b){
        return a + 1;
    }
    function func3() public pure returns (string memory){
        return "OLAR PLANETA";
    }
}

//PAYABLE FUNCTIONS

pragma solidity 0.5.12;

contract Sample{
    uint public amount = 0;
    function payme() public payable{
        amount += msg.value;
    }
}
