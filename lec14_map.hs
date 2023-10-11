add7, add13, add9, sub2 :: Int -> Int
add7 num = num + 7
add13 num = num + 13
add9 num = num + 9
sub2 num = num - 2

addY y num = num + y
add22 x = addY 22 x

add13All :: [Int] -> [Int]
--add13All lst = [x+13 | x <- lst]

addYAll :: Int -> [Int] -> [Int]
--addYAll y lst = [x+y | x <- lst]
addYAll y [] = []
addYAll y (x:xs) = (x+y):(addYAll y xs)

add13All [] = []
add13All (x:xs) = (addY 13 x):(add13All xs)

doubleAll [] = []
doubleAll (x:xs) = (2*x):(doubleAll xs)

absAll [] = []
absAll (x:xs) = (abs x):(absAll xs)

absAllHOF lst = map abs lst

singletons :: [a] -> [[a]]
singletons [] = []
singletons (x:xs) = ([x]):(singletons xs)
singletons lst = map makeList lst
  where makeList x = [x]

opAll :: (a -> b) -> [a] -> [b]
opAll op [] = []
opAll op (x:xs) = (op x):(opAll op xs)
opAll2 op lst = [op x | x <- lst]

cutoff :: [Int] -> [Int]
{-cutoff [] = []
cutoff (x:xs) = (max 0 x):(cutOff xs)-}
cutoff lst = opAll (max 0) lst

gradingFunction :: Int -> (Int -> Int)
gradingFunction a b = (a+100) `div` (b+20)

add20 = (+) 20

shoutStrings :: [String] -> [String]
shoutStrings lst = map (++"!") lst

shoutNumbers :: [Int] -> [String]
shoutNumbers nums = map (++"!") (map show nums)
shoutNumbers2 nums = map shout nums
  where shout x = (show x) ++ "!"
shoutNumbers3 nums = map ((++"!") show) nums

-- Uses of map
{-
ghci> map (replicate 3) [3..6]
[[3,3,3],[4,4,4],[5,5,5],[6,6,6]]
ghci> map (`replicate` 3) [3..6]
[[3,3,3],[3,3,3,3],[3,3,3,3,3],[3,3,3,3,3,3]]
ghci> map ((flip replicate) 3) [3..6]
[[3,3,3],[3,3,3,3],[3,3,3,3,3],[3,3,3,3,3,3]]
ghci> :t flip
flip :: (a -> b -> c) -> b -> a -> c
ghci> lstlst = [[1,2],[3,4,5,6],[],[20]]
ghci> map (map (^2)) lstlst
[[1,4],[9,16,25,36],[],[400]]
ghci> [[x^2 | x <- lst] | lst <- lstlst]
[[1,4],[9,16,25,36],[],[400]]
ghci>
ghci> [[x^2 | x <- lst] | lst <- lstlst]
 -}
