isZero :: Integer -> Bool
isZero 0 = True
isZero _ = False

isEmpty [] = True
isEmpty lst = False

addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double) 
--addVectors va vb = (fst va + fst vb, snd va + snd vb) 
addVectors (x1,y1) (x2,y2) = (x1+x2, y1+y2)

addPairs :: [(Int, Int)] -> [Int]
addPairs lst = [a + b | (a,b) <- lst]

startsWith :: Show a => [a] -> String
startsWith [] = "Nothing"
startsWith (x:xs) = show x

tell :: (Show a) => [a] -> String
tell [] = "The list is empty."
--tell (x:[]) = "The list has one element: " ++ show x ++ "."
tell ([x]) = "The list has one element: " ++ show x ++ "."
tell [x,y] = "The list has two elements: " ++ show x ++ " and " ++ show y ++ "."
tell (x:y:xs) = "The list is large, and starts with: " ++ show x ++ " and " ++ show y ++ "."

{-
 - endsInDot (str++".") = True
endsInDot _ = False

drop5 (x:xs) = 
  if x == 5
  then xs
  else (x:xs)
drop5 lst = 
  if head lst == 5
  then tail xs
  else lst
-}
drop5 lst@(x:xs) = 
  if x == 5
  then xs
  else lst 
drop5 [] = []

myEven x 
  | (x `mod` 2 == 0) = True
  | otherwise        = False

safeDivide x y
  | y == 0    = error "OH NO I'M GOING TO DIVIDE BY ZERO!"
  | otherwise = x / y

mileage miles gallons
    | mpg <= 10.0 = "get a new car!" ++ endStr
    | mpg <= 20.0 = "You're doing okay!" ++ endStr
    | mpg <= 40.0 = "You eco-warrior, you!" ++ endStr
    | otherwise   = "Do you know where a charging station is!" ++ endStr
  where mpg = miles / gallons
        endStr = "\nYou can go " ++ show (miles*10) ++ " miles on a full tank."

cylinder r h =
  let topArea = pi * r^2
      sideArea = h*2*pi*r
  in 2*topArea + sideArea 




