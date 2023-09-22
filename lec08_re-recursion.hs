secondToLast :: [a] -> a
secondToLast [] = error "AAAAAH NO SECOND TO LAST ELEMENT!"
secondToLast [x] = error "AAAAAH STILL NO SECOND TO LAST ELEMENT!"
secondToLast [x,y] = x
secondToLast (x:xs) = secondToLast xs
--or
secondToLast (x:xs) = 
  if length (x:xs) == 2
  then x
  else secondToLast xs

myZip :: [a] -> [b] -> [(a,b)]
myZip [] [] = []
myZip (x:xs) (y:ys) = (x,y):(myZip xs ys)
myZip _ _ = []
{-
myZip (x:xs) [] = []
myZip [] (y:ys) = []-}


--myZip [1,7,3,5] ['a','b','c','d']
--[(1,'a')', (7,'b'), (3, 'c'), (5,'d')]


myMaximum :: Ord a => [a] -> a
myMaximum [] = error "No maximum of an empty list."
myMaximum [x] = x
myMaximum (x:xs) = 
  let maxXs = myMaximum xs
  in if x > maxXs
     then x 
     else maxXs

elimDups :: Eq a => [a] -> [a]
elimDups = undefined
--elimDups [1,3,4,1] = [1,3,4] or [3,4,1]

--can you do it quicker if you know the list is sorted?
elimDupsSorted :: Ord a => [a] -> [a]
elimDupsSorted = undefined
--elimDupsSorted [1,1,3,4,4,5,6,7,7] = [1,3,4,5,6,7]


