pragma solidity 0.5.12;

contract MyContract {
    enum State { Waiting, Ready, Active }
    State public state;
 
    constructor() public {
        state = State.Waiting;
    }
    
    function activate() public {
        state = State.Active;
    }
    
    function isActive() public view returns(bool){
        return state == State.Active;
        //retorna "true" se o contrato foi ativado.
    }
}
