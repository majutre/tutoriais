pragma solidity 0.5.12;

contract MyContract {
    uint public peopleCount = 0;
    // ao acrescentar "=0" nos certificamos que a primeira pessoa será a número 1 na contagem, e não 0.
    mapping(uint => Person) public people;
   
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    function addPerson (string memory _firstName, string memory _lastName) public {
        peopleCount += 1;
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
        
    }
}
