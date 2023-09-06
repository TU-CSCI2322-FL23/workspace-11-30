import Data.List
setA = [7,3,1]
setB = [2,3,5]

union xs ys = nub (xs ++ ys)

intAB = [x | x <- setA, x `elem` setB]
interect setA setB = [x | x <- setA, x `elem` setB]

crossproduct xs ys = [(x,y) | x <- xs, y <- ys]

powerset xs = [ [] ] ++ [ [x] | x <- xs] 
              ++ [ [x,y] | x <- xs, y <- xs, x < y ] 
              ++ [ [x,y,z] | x <- xs, y <- xs, z <- xs, x < y, y < z ] 

-- $ is similar to parenthesis for order of operation
check = length $ powerset [1,2,3]

subset xs ys = [x | x <- xs, x `elem` ys] == xs
subset2 xs ys = and [x `elem` ys | x <- xs]

myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

fact :: Integer -> Integer
fact 0 = 1
fact n = n * fact (n-1)

numNonZero :: [Int] -> Int
numNonZero [] = 0
{-numNonZero (x:xs) = 
            if x == 0 
            then numNonZero xs 
            else 1 + numNonZero xs-}
numNonZero (0:xs) = 1 + numNonZero xs
numNonZero (x:xs) = numNonZero xs

myProduct :: [Integer] -> Integer
myProduct [] = 1
myProduct (x:xs) = x * myProduct xs

positiveProduct :: [Integer] -> Integer
positiveProduct [] = 1
positiveProduct (x:xs) = 
      (if x > 0 then x else 1) * positiveProduct xs

myMaximum :: Ord a => [a] -> a
myMaximum [] = error "No maximum of an empty list."
myMaximum [x] = x
myMaximum (x:xs) = if x > myMaximum xs then x else myMaximum xs

myLast [] = error "No last element of the empty list."
myLast [x] = x
myLast (x:xs) = myLast xs

