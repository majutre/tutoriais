pragma solidity 0.5.12;

contract messageContract{
    string private message = "Hello World";
    
    function getMessage() public view returns(string memory _message){
        return message;
    }

    function setMessage(string memory newMessage) public {
        message = newMessage;
    }
}
