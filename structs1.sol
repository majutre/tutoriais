pragma solidity 0.5.11;

contract MyContract {
    Person[] public people;
    /*"people" é uma variável que estará visível publicamente. 
    "Person[]" significa que faremos uma array com as infos coletadas na struct abaixo. */
    
    uint public peopleCount;
    //essa uint servirá para saber quantas pessoas foram adicionadas à array.
    
    struct Person {
        string _firstName;
        string _lastName;
    }
    // structs servem para coletar informações com mais de um parâmetro.
    
    function addPerson (string memory _firstName, string memory _lastName) public {
        people.push(Person(_firstName, _lastName));
        //a função .push serve para adicionar novos itens a uma array. No caso, essa função adiciona novas pessoas à array "Person" acima.
        peopleCount += 1;
        //a cada nova pessoa adicionada, o peopleCount será atualizado.
    }
}

/*OBS.: após o deploy, a caixa "people" não trará automaticamente todos os valores inseridos na array. 
Cada nova Person adicionada terá um número, começando do 0. 
Para identificar uma pessoa, devemos jogar o número dela na caixa "people"*/
