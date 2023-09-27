import Data.Maybe
--lookupVal :: Eq k => k -> [(k,v)] -> Maybe v
lookupVal key assocs = 
  let results = [v | (k,v) <- assocs, k == key]
    in if length results == 1 -- not $ null results
       then Just (head results)
       else Nothing


charsToNums = zip (['a'..'z']++['A'..'Z']) ([1..26]++[1..26])

sumWord :: String -> Int
sumWord [] = 0
sumWord (c:cs) = 
  case lookupVal c charsToNums of
    Just x -> x + sumWord cs
    Nothing -> sumWord cs

defaultZero :: Maybe Int -> Int
defaultZero Nothing = 0
defaultZero (Just x) = x

sumWord2 word = sum [defaultZero (lookupVal c charsToNums) | c <- word]

lstA = [Just 4, Just 3, Just 7]
lstB = [Just 4, Nothing, Just 7]

seqExampleA = sequence lstA 
-- Just [4,3,7]
seqExampleB = sequence lstB
-- Nothing
catMaybesExampleA = catMaybes lstA
-- [4,3,7]
catMaybesExampleB = catMaybes lstB
-- [4,7]
