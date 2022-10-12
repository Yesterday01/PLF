------- EJERCICIO 1 -------
average3Numbers :: Fractional a => a -> a -> a -> a
average3Numbers n1 n2 n3 = (n1+n2+n3)/3

------- EJERCICIO 2 -------
isLastDigit3 :: Integral a => a -> Bool
isLastDigit3 num = (rem num 10) == 3

------- EJERCICIO 3 ------- 
has3digits :: Integral a => a -> Bool
has3digits num = num > 99 && num < 1000;

------- EJERCICIO 4 ------- 
isNegative :: Integral a => a -> Bool
isNegative num = num<0

------- EJERCICIO 5 -------
sum2Digits :: Integral a => a -> a
sum2Digits num
    | num <10 || num>99 = error "Necesito un numero de dos digitos"
    |otherwise = div num 10 + (num - (div num 10 * 10))

------- EJERCICIO 6 -------
even2Digit:: Int->Bool
even2Digit x 
    | (x > 9 && x < 100) = even (x `mod` 10) && even((x `div` 10) `mod` 10) 
    | otherwise = error "El numero no es de dos digitos "

------- EJERCICIO 7 -------
isPrimerNumber :: Int ->Bool
isPrimerNumber n
    |n == 2 ||n==3|| n== 5 || n==7 ||n == 11 || n==13|| n == 17 || n==19 = True
    |otherwise = False

------- EJERCICIO 8 -------
isPrimeNumber2 :: Int ->Bool
isPrimeNumber2 n
    |(n == 2 || n==3|| n == 5 || n==7 ||n == 11 || n==13|| n == 17 || n==19 ) && even n = True
    | otherwise = False

------- EJERCICIO 9 -------
isMultiple :: (Integral a) => a -> a -> Bool
isMultiple x y
    |mod x y == 0 = True
    |otherwise = False

------- EJERCICIO 10 -------
isEqual2Digits :: (Integral a) => a -> Bool
isEqual2Digits x
    |(x > 9 && x < 100) && (div x 10 == mod x 10) = True
    |otherwise = False

------- EJERCICIO 11 -------
higher :: (Integral a) => a -> a -> a -> a
higher x y z = max x (max y z)

------- EJERCICIO 12 -------
isEvenSum2Number :: (Integral a) => a -> a -> Bool
isEvenSum2Number x y = even (x+y)

------- EJERCICIO 13 -------
sum2Digit2Number :: (Integral a) => a -> a -> a
sum2Digit2Number x y
    |x > 9 && x <100 && y > 9 && y <100 = (div x 10 + mod x 10) + (div y 10 + mod y 10)
    |otherwise = error "Algún número no tiene 2 dígitos"

------- EJERCICIO 14 -------
sum3Digits :: (Integral a) => a -> a
sum3Digits x
    |x > 99 && x <1000 = (div x 100 + div (mod x 100) 10 + mod (mod x 100) 10)
    |otherwise = error "El número no tiene 3 dígitos"

------- EJERCICIO 15 -------
equal3Digits :: (Integral a) => a -> Bool
equal3Digits x 
    |(x > 99 && x <1000) && (cent == dece || cent == uni || dece == uni)= True
    |(x > 99 && x <1000) && (cent /= dece && cent /= uni && dece /= uni)= False
    |otherwise = error "El número no tiene 3 dígitos"
    where
        cent = div x 100
        dece = div (mod x 100) 10
        uni = mod (mod x 100) 10

------- EJERCICIO 16 -------
positionHigher3Digits :: Integer -> String
positionHigher3Digits x
    |(x > 99 && x <1000) && ((max x1 x2 == x1) && (max x1 x3 == x1))= "El mayor se encuentra en la pos 1"
    |(x > 99 && x <1000) && ((max x1 x2 == x2) && (max x2 x3 == x2))= "El mayor se encuentra en la pos 2"
    |(x > 99 && x <1000) && ((max x1 x3 == x3) && (max x2 x3 == x3))= "El mayor se encuentra en la pos 3"
    |otherwise = error "El número no tiene 3 dígitos"
    where
        x1 = div x 100
        x2 = div (mod x 100) 10
        x3 = mod (mod x 100) 10

------- EJERCICIO 17 -------
palindrome :: Eq a => [a] -> Bool
palindrome xs = xs == reverse xs

------- EJERCICIO 18 -------
safeDivision :: (Ord p, Floating p) => p -> p -> p
safeDivision x y
    |y == 0 = error "No es posible dividir entre 0"
    |otherwise = x / y

------- EJERCICIO 19 -------
xor :: Bool -> Bool -> Bool
xor x y
    |x == False && y == True = True
    |x == True && y == False = True
    |otherwise = False

------- EJERCICIO 20 -------
distance :: Floating a => (a, a) -> (a, a) -> a
distance (x1,y1) (x2,y2) = sqrt(((x2 - x1)^2) + ((y2 - y1)^2))
