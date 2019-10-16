pragma solidity 0.5.11;

contract MyContract {
    uint public peopleCount = 0;
    mapping(uint => Person) public people;
    
    uint openingTime = 1571233737;
    //                  ^timestamp
    
    modifier onlyWhileOpen(){
        require(block.timestamp >= openingTime, "Operação expirada");
        _;
    }
       
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    
   
    
    function addPerson (string memory _firstName, string memory _lastName) public onlyWhileOpen {
        //                                                                         ^modifier
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
        
    }
    function incrementCount() internal {
        peopleCount += 1;
    }
}
