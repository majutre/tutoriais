// esse tutorial serve para mostrar o que não devemos fazer. Over e Underflow bugam o contrato.

pragma solidity 0.5.12;

contract OverflowAndUnderflow{
    
    function overflow() public pure returns (uint){
        uint max = 2 ** 256 - 1;
        return max + 1;
    // essa função retornará o valor 0, pois excede o valor aceito pela uint256.
    }
     function underflow() public pure returns (uint){
        uint min = 0;
        return min - 1;
    // A função acima está "errada", e merece atenção. Ao chamar a função, o valor retornado será o maior permitido pelo uint 256 (11579...9935)
     }
}

