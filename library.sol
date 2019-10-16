pragma solidity 0.5.12;

//"DRY" = Don't Repeat Yourself

library Math {
    function divide(uint a, uint b) internal pure returns (uint) {
        require(b>0);
        uint c = a / b;
        return c;
    }
}

contract myContract {
    uint public value;
    
    function calculate (uint _value1, uint _value2) public {
        value = Math.divide(_value1, _value2);
    }   
}

/* é possível deixar a library em outro arquivo. aí antes do contract, colocar
"./Math.sol";
com as aspas. Lembrando que Math.sol é o nome do arquivo aonde estará a library.

ficaria assim:

  pragma solidity 0.5.12;

  import "./Math.sol";

  contract myContract {
    uint public value;
    
      function calculate (uint _value1, uint _value2) public {
        value = Math.divide(_value1, _value2);
      }   
  }



*/
