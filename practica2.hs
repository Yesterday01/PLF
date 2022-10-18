{-------------------------- EJERCICIO 1 ---------------------------------
*************************************************************************
->FUNCION: El primer elemento de una lista pasa a ser el ultimo de esta
->RECIBE: Una lista de elementos de tipo Ord
->REGRESA: Una lista de elementos de tipo Ord
***********************************************************************-}
firstToEnd :: (Ord a) => [a] -> [a]
firstToEnd xs = drop 1 xs ++ [head xs]

{-------------------------- EJERCICIO 2 ---------------------------------
*************************************************************************
->FUNCION: Regresa una lista con dos elementos, siendo estos el maximo y
minimo de una lista
->RECIBE: Una lista de elementos de tipo Ord
->REGRESA: Una lista de dos elementos de tipo Ord
***********************************************************************-}
minAndMax :: (Ord a) => [a] -> [a]
minAndMax xs = minimum xs : [maximum xs]

{-------------------------- EJERCICIO 3 ---------------------------------
*************************************************************************
->FUNCION: Regresa una lista con los elementos menores al primer elemento
de una lista, el primer elemento se ignora
->RECIBE: Una lista de elementos de tipo Integral
->REGRESA: Una lista de elementos de tipo Integral
***********************************************************************-}
minorsFirstElement :: (Integral a) => [a] -> [a]
minorsFirstElement xs = filter (head xs >) (drop 1 xs)

{-------------------------- EJERCICIO 4 ---------------------------------
*************************************************************************
->FUNCION: Regresa una lista con los elementos mayores o iguales al pri-
mer elemento de una lista, ignorando este elemento en la lista a regresar
->RECIBE: Una lista de elementos de tipo Integral
->REGRESA: Una lista de elementos de tipo Integral
***********************************************************************-}
greaterOrEqualFirstElement :: Integral a => [a] -> [a]
greaterOrEqualFirstElement [] = error "Lista vacia"
greaterOrEqualFirstElement [a] = error "Solo hay un elemento"
greaterOrEqualFirstElement list = [x | x <- tail list , x >=head list]

{-------------------------- EJERCICIO 5 ---------------------------------
*************************************************************************
->FUNCION: Regresa una lista con los elementos menores a la suma del pri-
mer elemento con el segundo elemento de una lista, ignorando estos ele-
mentos en la lista a regresar
->RECIBE: Una lista de elementos de tipo Integral
->REGRESA: Una lista de los elementos menores a la suma de tipo Integral
***********************************************************************-}
minorsToSumFirstAndSecondElement :: Integral a => [a] -> [a]
minorsToSumFirstAndSecondElement [] = error "Lista vacia"
minorsToSumFirstAndSecondElement [a] = error "Solo hay un elemento"
minorsToSumFirstAndSecondElement list= [x | x <- tail (tail list) , x <head list + head(tail list)]

{-------------------------- EJERCICIO 6 ---------------------------------
*************************************************************************
->FUNCION: Regresa una lista con la suma de los elementos de cada tupla
que se encuentre en la lista dada
->RECIBE: Una lista de tuplas de tipo Integral
->REGRESA: Una lista con la suma de los elementos de las tuplas de tipo
Integral
***********************************************************************-}
listSumDuplaToList :: Integral a => [(a,a)] -> [a]
listSumDuplaToList [] = []
listSumDuplaToList list = fst(head list) + snd (head list) : listSumDuplaToList (tail list)

{-------------------------- EJERCICIO 7 ---------------------------------
*************************************************************************
->FUNCION: Regresa una lista con la multiplicacion de los elementos de
cada tripleta que se encuentren en la lista dada
->RECIBE: Una lista de tripletas de tipo Integral
->REGRESA: Una lista con la multiplicacion de los elementos de las tuplas
de tipo Integral
***********************************************************************-}
listMulTripletaToList :: (Integral a) => [(a,a,a)] -> [a]
listMulTripletaToList [] = []
listMulTripletaToList xs = [x*y*z | (x,y,z) <- xs]

{-------------------------- EJERCICIO 8 ---------------------------------
*************************************************************************
->FUNCION: Cambia los elementos de cada tupla que se encuentren en cada
lista, siendo el primer elemento el segundo, y el segundo el primero
->RECIBE: Una lista de tuplas de tipo Integral
->REGRESA: Una lista de tuplas de tipo Integral
***********************************************************************-}
changeFstToSnd :: (Integral a) => [(a,a)] -> [(a,a)]
changeFstToSnd [] = []
changeFstToSnd xs = (snd (head xs),fst (head xs)) : changeFstToSnd (tail xs)

{--------------------------- EJERCICIO 9 ---------------------------------
**************************************************************************
->FUNCION: Realiza la suma de vectores, siendo estos tuplas que se encuen-
tran en una lista
->RECIBE: Una lista de vectores (tuplas) de tipo Num
->REGRESA: Una vector (tupla) siendo este la suma de vectores, de tipo Num
*************************************************************************-}
sumVectors :: (Num a) => [(a,a)] -> (a,a)
sumVectors [x] = (fst x,snd x)
sumVectors list = (fst (head list) + fst (sumVectors (tail list)),snd (head list) + snd (sumVectors (tail list)))

{-------------------------- EJERCICIO 10 ---------------------------------
*************************************************************************
->FUNCION: Regresa una lista con los divisores de un numero dado
->RECIBE: Un numero de tipo Integral
->REGRESA: Una lista con los divisores, siendo de tipo Integral
***********************************************************************-}
dividers :: (Integral a) => a -> [a]
dividers n = [x | x <- [1..n], (mod n x) == 0]

{-------------------------- EJERCICIO 11 ---------------------------------
*************************************************************************
->FUNCION: Regresa una lista con los números primos existentes del 1 al n
->RECIBE: Un numero n que sera el límite
->REGRESA: Una lista con los numeros primos del 1 al n, de tipo Integral
***********************************************************************-}
primeNumbers :: (Integral a) => a -> [a]
primeNumbers n = [x | x <- [2..n], dividers x == [1,x]]

{-------------------------- EJERCICIO 12 ---------------------------------
*************************************************************************
->FUNCION: Regresa una lista de números primos existentes del 1 al infi-
nito
->RECIBE: Nada, ningun parametro
->REGRESA: Una lista de números primos, del 1 al infinito
***********************************************************************-}
infinitePrimeNumbers :: (Integral a) => [a]
infinitePrimeNumbers = [x | x <- [2..], dividers x == [1,x]]