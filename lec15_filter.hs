evens :: [Int] -> [Int]
evens [] =[]
evens (x:xs) = 
  if even x 
  then x:(evens xs)
  else evens xs

isUpper = (`elem` ['A'..'Z'])

uppers :: String -> String
uppers "" = ""
uppers (c:cs) = 
  if isUpper c
  then c:(uppers cs)
  else uppers cs

chooser :: (a -> Bool)-> [a] -> [a]
chooser p [] = []
chooser p (x:xs) = 
  if p x
  then x:(chooser p xs)
  else chooser p xs

lst = [1..10000]
biggestDivisor =
  let p x = x `mod` 17 == 0 
  in maximum $ filter p lst
biggestDivisorWithLambda = maximum $ filter (\x -> x`mod`17 == 0) lst

singletonsLambda lst = map (\x -> [x]) lst
singletonsEvil lst = map (:[]) [7,3,1,5]

sub2 lst = map (\x -> x-2) lst


f = (\x -> x + 3)
--please just use f x = x + 3


--ACTIVITY!
--Define with a map!
addPairs :: [(Int, Int)] -> [Int]
--addPairs [(7,3), (1,2)] = [10, 3]
--First, with a helper functions
--Second, with a lambda.
--
--Define with a filter:
zeroDetector :: [Int] -> Bool
--simpler way: zeroDetector lst = 0 `elem` lst
--But do it with a filter!

splitOnParity :: [Int] -> ([Int], [Int])
--return (list of evens, list of odds)
--
--
