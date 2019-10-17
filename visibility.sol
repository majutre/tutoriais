//    ESTRUTURA DAS FUNÇÕES
function functionName(<parameter types>) public/private/etc pure/view/payable returns (<return types>) {}
//                                        ^visibilidade     ^mutabilidade     ^valores retornados

/*
PUBLIC: pode ser chamada interna ou externamente;
PRIVATE: só pode ser chamada dentro do contrato em que está definida;
EXTERNAL: pode ser chamada de outros contratos ou via transações.
  OBS.: state variables ***não podem*** ser externas;
        para chamar a função dentro do contrato, devemos usar "this".
INTERNAL: só pode ser acessada internamente (dentro do contrato ou em contratos que derivam dele).
*/

//INTERNAL AND PRIVATE FUNCTIONS

pragma solidity 0.5.12;

contract C {
    uint private data;
    
    function f(uint a) private pure returns(uint b) {
        return a + 1;
    }
    function setData(uint a) public {
        data = a;
    }
    function getData() public view returns (uint) {
        return data;
    }
    function compute (uint a, uint b) internal pure returns (uint) {
        return a+b;
    }
    
}

contract D {
    function readData() public{
        C c = new C();
        uint local = c.f(7); //ERRO: "f" não é visível fora do contrato C.
        c.setData(3);
        local = c.getData();
        local = c.compute(3, 5); //ERRO: "compute" não é visível.
        
    }
}

contract E is C {
    function g() public {
    C c = new C();
    uint val = compute (3, 5); // aqui não há erro, pois "compute" é visível para contratos derivados.
    }
}
