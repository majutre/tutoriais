<address>.balance
 ^saldo do address em Wei.
  
<address>.transfer(uint amount)
 ^envia X quantidade de Wei ao address.

<address>.send(uint amount) returns (bool)
^envia X quantidade de Wei ao address. Retorna "falso" se falhar.

<address>.call(...) returns (bool)
^low level CALL, retorna "falso" se falhar.

<address>.callcode(...) returns (bool)
^low level CALLCODE, retorna "falso" se falhar.

<address>.call(...) returns (bool)
^low level DELEGATE CALL, retorna "falso" se falhar.
