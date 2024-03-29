pragma solidity 0.5.11;

contract MyContract {
    uint public peopleCount = 0;
    mapping(uint => Person) public people;
   
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    function addPerson (string memory _firstName, string memory _lastName) public {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
        
    }
    function incrementCount() internal {
        peopleCount += 1;
    }
}
