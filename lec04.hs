x = 7
y = 7.0
unitRectangle = [(0,0), (0,1), (1,1), (1,0)]
name :: String
name = "Jane Overload"
schedule :: ([Char], [[Char]])
schedule = (name, ["CSCI 2322", "CSCI 3320", "MATH 3326", "BIO 3446", "CSCI 3368"])

b = [[[[["a"]]]]]

aListOfTuples = [(a,b) | a <- [1..], b <- [1..]]

weirdList :: [Integer]
weirdList = reverse [1..]

--weirdVal = 7.3 + head weirdList
removeUpper str = [x | x <- str, x `notElem` ['A'..'Z'] ]

addThree :: Integer -> Integer -> Integer -> Integer
addThree x y z = x + y + z

addThreeTuple :: (Integer, Integer, Integer) -> Integer
addThreeTuple (x,y,z) = x + y + z

