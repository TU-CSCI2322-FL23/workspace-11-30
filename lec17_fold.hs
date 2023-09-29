mySum :: [Int] -> Int
mySum [] = 0
mySum (x:xs) = x + mySum xs 

myProduct :: [Integer] -> Integer
myProduct [] = 1
myProduct (x:xs) = x * myProduct xs

myConcat :: [[a]] -> [a]
myConcat [] = []
myConcat (list:lists) = list ++ myConcat lists

katamari :: ( a -> b -> b ) -> b  -> [a] -> b
katamari f b [] = b
katamari f b (x:xs) = x `f` (katamari f b xs)
--katamari f b (x:xs) = f x (katamari f b xs)

iramatak :: (b -> a -> b) -> b  -> [a] -> b
iramatak f b [] = b
iramatak f b (x:xs) = iramatak f (f b x) xs

addNumber :: Int -> String -> String
addNumber x str = str ++ ": " ++ (show x)


myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

myLength2 lst = foldr incSecond 0 lst
  where incSecond x acc = 1 + acc

myLength3 lst = foldr (\x acc -> 1+acc) 0 lst 

numNonZero [] = 0
numNonZero (x:xs) = 
            if x == 0 
            then numNonZero xs 
            else 1 + numNonZero xs

numNonZero2 lst = foldr (\x acc -> if x == 0 
                                   then acc
                                   else 1 + acc) 0 lst

myMaximum :: Ord a => [a] -> a
myMaximum [] = error "No maximum of an empty list."
myMaximum [x] = x
myMaximum (x:xs) = if x > myMaximum xs then x else myMaximum xs

myMaximum2 [] = error "no maximum"
myMaximum2 (x:lst) = foldr (\x acc -> if x > acc then x else acc) x lst
myMaximum3 lst = foldr1 (\x acc -> if x > acc then x else acc) lst

myZip :: [a] -> [b] -> [(a,b)]
myZip [] [] = []
myZip (x:xs) (y:ys) = (x,y):(myZip xs ys)
myZip _ _ = []

myLast2 lst = foldr1 (\x acc -> acc) lst


