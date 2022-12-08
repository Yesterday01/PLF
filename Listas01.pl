%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 1.PREDICADO PERTENECE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
->Descripción: Busca si un elemento pertenece a una lista. Este elemento es comparado por cada elemento de la lista si es igual
si es asi termina, sino llega hasta el caso base en el que si no es igual al ultimo elemento termina.
->Parámetros: Tiene dos de ariedad, el primer termino es el elemento a buscar y el segundo una lista.
->Valor de retorno: Valor boleano, regresa true si el elemento se encuentra en la lista y false si no se encuentra.
*/
pertenece(E,[E]).
pertenece(E,[X|XS]) :- E =:= X.
pertenece(E,[X|XS]) :- E =\= X, pertenece(E,XS).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2.PREDICADO SIZE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
->Descripción: Devuelve el tamaño, longitud de una lista. El caso base es que si solo hay un elemento, el tamaño es uno, y si no
es un solo elemento, entra a recursibidad y se le suma un uno a la variable.
->Parámetros: Tiene dos de ariedad, el primer termino es una lista y el segundo una variable que sera el tamaño de la lista.
->Valor de retorno: Numero entero, regresa la longitud de la lista, o sea, el total de elementos de la lista.
*/
size([U],1).
size([X|XS],R) :- size(XS,Count), R is 1 + Count.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 3.PREDICADO CONCATENAR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
->Descripcion: Une dos listas en una sola. En el caso base, al llegar al final de la primera lista, entonces, la lista a regre-
sar sera la segunda lista, y en el otro caso, esa lista se le concatenara el ultimo elemento al principio de la lista a regre-
sar, asi hasta que esten unidas ambas listas.
->Parámetros: Tiene tres de ariedad, el primer y el segundo termino son las listas que se quiere concatenar y el tercero va
a ser la lista resultante.
->Valor de retorno: Una lista, devuelve en el tercer termino la lista unificada de los dos primeros terminos.
*/
concatenar([],L2,L2).
concatenar([X|XS],L2,[X|R]) :- concatenar(XS,L2,R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 4.PREDICADO ELIMINAR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
->Descripción: Elimina un elemento de una lista. En el caso base, si la lista esta vacia, es porque no se encontro el elemento y
regresara una lista vacia, en los demas casos, si el elemento es igual al primer elemento, entonces, el primer elemento no se 
concatenara a la lista a regresar.
->Parámetros: Tiene tres de ariedad, el primer termino debe ser el elemento que se desea borrar de la lista, el segundo
la lista de donde se desea eliminar ese termino y el tercero la lista resultante con el elemento eliminado.
->Valor de retorno: Devuelve una lista sin el elemento que se deseaba eliminar.
*/
eliminar(_,[],[]).
eliminar(E,[E],[]).
eliminar(E,[X|XS],Res) :- E =:= X, eliminar(E,XS,Res).
eliminar(E,[X|XS],[X|Res]) :- E =\= X, eliminar(E,XS,Res).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 5.PREDICADO AGREGAR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
->Descripción: Agrega un elemento al principio de una lista.
->Parámetros: Tiene tres de ariedad, el primer termino es el elemento que se desea agregar, el segundo es la lista a donde
se va a agregar el elemento y el tercero es la lista resultante.
->Valor de retorno: Devuelve una lista con el elemento agregado al principio de esta.
*/
agregar(Elem,R1,[Elem|R1]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 6.PREDICADO SEPARAR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
->Descripción: Separa una lista en otras dos, conteniendo en la primera los elementos pares de la lista original y en la segunda
los elementos impares de la lista original. Si el residuo es igual a cero de la division entre el primer elemento y dos, este
se concatenara a la primera lista, sino, se concatenara a la segunda lista, asi hasta llegar al caso base que es cuando ya reco-
rrimos toda la lista y lleguemos a una vacia.
->Parámetros: Tiene tres de ariedad, el primer termino es la lista a separar, el segundo es la lista con los elementos pares a
regresar y el tercero es la lista con los elementos impares a regresar.
->Valor de retorno: Devuelve dos lista, una con elementos pares y la otra con elementos impares.
*/
separar([],[],[]).
separar([X|Tail],[X|R1],R2) :- X mod 2 =:= 0, separar(Tail,R1,R2).
separar([X|Tail],R1,[X|R2]) :- X mod 2 =\= 0, separar(Tail,R1,R2).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 7.PREDICADO ASCENDENTE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
->Descripción: Verifica si los elementos de una lista esta insertados de forma ascendente. Va comparando el primer elemento con
el segundo, con la condición de que el primero sea menor que el segundo, de ahi pasa le segundo elemento junto con la raiz como
la lista, y hace lo mismo hasta llegar al caso base en el que la raiz esta vacia.
->Parámetros: Tiene uno de ariedad, este termino es la lista.
->Valor de retorno: Devuelve valor boleano, true si los elementos si estan de forma ascendente, false sino.
*/
ascendente([X1,X2|[]]) :- X1 < X2.
ascendente([X1,X2|Tail]) :- X1 < X2, ascendente([X2|Tail]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 8.PREDICADO DESCENDENTE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
->Descripción: Verifica si los elementos de una lista esta insertados de forma descendente. Va comparando el primer elemento con
el segundo, con la condición de que el primero sea mayor que el segundo, de ahi pasa le segundo elemento junto con la raiz como
la lista, y hace lo mismo hasta llegar al caso base en el que la raiz esta vacia.
->Parámetros: Tiene uno de ariedad, este termino es la lista.
->Valor de retorno: Devuelve valor boleano, true si los elementos si estan de forma descendente, false sino.
*/
descendente([X1,X2|[]]) :- X1 > X2.
descendente([X1,X2|Tail]) :- X1 > X2, descendente([X2|Tail]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 9.PREDICADO APLANAR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
->Descripción: Si una lista tiene como elementos otra lista, deshace esas listas internas y los elementos de las listas internas
pasan a ser parte de la lista padre por asi decirlo. Si el elemento es atomico, osea es un digito, esta se mantiene en la lista.
Si el elemento no es atomico, o sea, es una lista, entonces pasa a aplanarse, asi hasta que esa lista este aplanada, posterior,
se aplana la raiz para al final concatenarlo, y la lista resultante de la concatenación se va a concatenar con los demas
elementos.
-Parámetros: Tiene dos de ariedad, el primer termino debe ser la lista a aplanar, el segundo sera una variable que regresara la
lista ya aplanada.
->Valor de retorno: Devuelve una lista, esta lista solo contendra elementos atomicos.
*/
aplanar([],[]).
aplanar([X|R],[X|P]) :- atomic(X), aplanar(R,P).
aplanar([X|R],P) :- not(atomic(X)), aplanar(X,P_X), aplanar(R,P_R), concatenar(P_X,P_R,P).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 10.PREDICADO MENORHEAD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
->Descripción: Devuelve una lista con todos los elementos menores al primer elemento de la lista. Compara, si el primer elemento
es mayor que el segundo, entonces al segundo se le uniran los demas elementos, y en la recursion, se mantiene el primer elemen-
to y se le concatena la raiz, si no es mayor que el segundo elemento, se sigue la recursion pero al segundo elemento ya no se le
concatenara nada. Asi hasta llegar al caso base donde solo hay un elemento y la raiz esta vacia.
->Parámetros: Tiene dos de ariedad. El primer termino debe ser una lista y el segundo regresara la lista con los elementos que
cumplan con la condición.
->Valor de retorno: Devuelve una lista, con los elementos que sean menores al primer elemento de la lista del primer termino.
*/
menorHead([_|[]],[]).
menorHead([A1,A2|B],[A2|L]) :- A1 > A2, menorHead([A1|B],L).
menorHead([A1,A2|B],L) :- A1 =< A2, menorHead([A1|B],L).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 11.PREDICADO MAYORHEAD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
->Descripción: Devuelve una lista con todos los elementos mayores al primer elemento de la lista. Compara, si el primer elemento
es menor que el segundo, entonces al segundo se le uniran los demas elementos, y en la recursion, se mantiene el primer elemen-
to y se le concatena la raiz, si no es menor que el segundo elemento, se sigue la recursion pero al segundo elemento ya no se le
concatenara nada. Asi hasta llegar al caso base donde solo hay un elemento y la raiz esta vacia.
->Parámetros: Tiene dos de ariedad. El primer termino debe ser una lista y el segundo regresara la lista con los elementos que
cumplan con la condición.
->Valor de retorno: Devuelve una lista, con los elementos que sean mayores al primer elemento de la lista del primer termino.
*/
mayorHead([_|[]],[]).
mayorHead([A1,A2|B],[A2|L]) :- A1 < A2, mayorHead([A1|B],L).
mayorHead([A1,A2|B],L) :- A1 >= A2, mayorHead([A1|B],L).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 12.PREDICADO INVERTIR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
->Descripción: Invierte una lista. Va a recorrer toda la lista hasta que quede vacia, por lo que va a devolver una lista vacia y
esta la va a concatenar al ultimo elemento, de ahi, del resultado de la concatenación, se le va a concatenar al penultimo ele-
mento quedan al principio de la lista, y asi hasta regresar al primer elemento.
->Parámetros: Tiene dos de ariedad, el primer elemento debe ser una lista, y el segundo sera la lista invertida.
->Valor de retorno: Devuelve una lista invertida a comparanción del primer termino.
*/
invertir([],[]).
invertir([X|XS],L) :- invertir(XS,Z), concatenar(Z,[X],L).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
