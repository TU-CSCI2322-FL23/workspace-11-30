{- Fold Practice Activity

Define the following functions using higher-order functions. You may first write the function using
recursion, and then translate to a fold. Certain problems restrict which functions can be used.

foldl :: (b -> a -> b) -> b -> [a] -> b
foldr :: (a -> b -> b) -> b -> [a] -> b
map :: (a -> b) -> [a] -> [b]
filter :: (a -> Bool) -> [a] -> [a]
-}

-- 1) Define myAnd :: [Bool] -> Bool to take the conjunction of a list.
myAnd :: [Bool] -> Bool
myAnd = undefined

-- 2) Using a fold, define positives :: [Int] -> [Int] that returns the positive elements.
positives :: [Int] -> [Int]
positive = undefined

-- 3) Using a fold, define range :: [Int] -> (Int,Int) 
range :: [Int] -> (Int, Int)
range lst = (min lst, max lst)

-- 4) Redefine zeroDetector :: [Int] -> Bool using a fold
zeroDetector :: [Int] -> Bool
zeroDetector lst = not $ null $ filter (==0) lst

-- 5) Redefine splitOnParity :: [Int] -> ([Int], [Int]) using a fold instead of filters.
splitOnParity :: [Int] -> ([Int], [Int])
splitOnParity lst = (filter even lst, filter odd lst)

-- 6) Define sumValues :: [(a, Int)] -> Int that sums the values of an association list.  
sumValues :: [(a, Int)] -> Int

-- 7) Define bestKey :: [(a, Int)] -> a that finds the key with the maximum value.
bestKey :: [(a, Int)] -> a

-- 8) Define a higher-order function exists :: (a -> Bool) -> [a] -> Bool that takes a predicate, a
-- list, and returns true if the predicate is true for anything in the list. 
   -- a) Using recursion.
   -- b)(Optional) using a fold.
exists :: (a -> Bool) -> [a] -> Bool
exists = undefined

-- 9) Rewrite zeroDetector using only exists.
zeroDetector2 :: [Int] -> Bool
zeroDetector2 = undefined

-- 10) Using exists, define isPrime :: Int -> Bool
isPrime :: Int -> Bool
isPrime = undefined
-- Hint: First define isMultiple :: Int -> Int -> Bool that takes two Ints and returns True if the
-- first can be divided by the second.
