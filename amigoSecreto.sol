pragma solidity 0.5.12;

contract AmigoSecreto{

    address payable dono;
    string[] private dadosParticipantes;
    address[] public addressParticipantes;
    bool public emAberto = true;

    event novoParticipante(address participante, string data);
    event ASDefinido(address amigoS, address para, string data);

    constructor() public{
        dono = msg.sender;
    }

    /*
    Join the secret santa event.
    We will keep track of your ethereum address of choice, the one you called this function with.
    Please also include:
    - Name
    - Email
    - address
    - anything the person should know about you to get you the best gift ever 

    Please keep gifts 

    You can call this function multiple times using the same address, to update the info you put in.

    MAKE SURE IT HAS AN EMAIL
    */

    function Participar(string memory _data) public{
        require(emAberto); //make sure signups are open

        dadosParticipantes.push(_data);
        addressParticipantes.push(msg.sender);

        emit novoParticipante(msg.sender, _data);
    }

    /*allow owner to close signups 
    * emit events for who has who.
    * we will watch contract for events and parse out your email.
    * then
    */ 
    function announce() public {
        require(msg.sender == dono);
        require(addressParticipantes.length >= 1);
        require(emAberto);
        emAberto = false; // turn it off.

        uint size = addressParticipantes.length;

        //person who signed up first (0) gets last person to sign up. Kept seperate from loop for edges.
        emit ASDefinido(addressParticipantes[0], addressParticipantes[size - 1], dadosParticipantes[size - 1]);

        //annouce who has who.
        //If you search for your own name, you will only find the address of the person sending you things.
        for(uint i = 1; i < size; i++){
            //person at i, gets person before them
            emit ASDefinido(addressParticipantes[i], addressParticipantes[i - 1], dadosParticipantes[i - 1]);
        }

        //just incase any eth is sent here by accident, send it to me.
        dono.transfer(address(this).balance);
    }


    //allow owner to reopen for any reason
    function reabrir() public{
        require(msg.sender == dono);
        emAberto = true;
    }
