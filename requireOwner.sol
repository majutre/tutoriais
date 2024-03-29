pragma solidity 0.5.11;

contract MyContract {
    uint public peopleCount = 0;
    mapping(uint => Person) public people;
    
    address owner;
    
    modifier onlyOwner(){
        require(msg.sender == owner, "Operação exclusiva do owner");
        _;
    }
       
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    constructor() public{
        owner = msg.sender;
    }
    
    function addPerson (string memory _firstName, string memory _lastName) public onlyOwner {
        //                                                                         ^modifier
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
        
    }
    function incrementCount() internal {
        peopleCount += 1;
    }
}
