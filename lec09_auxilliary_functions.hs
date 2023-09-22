import Data.List (sort)

occurancesOfHead :: Eq a => [a] -> Int
occurancesOfHead [] = error "Empty list, no head to occur."
occurancesOfHead (x:xs) = count x (x:xs)

count item [] = 0
count item (x:xs) = 
  if x == item 
  then 1 + (count item xs)
  else count item xs

elimDups :: Ord a => [a] -> [a]
elimDups [] = []
elimDups (x:xs) =
  let cleanXs = elimDups xs
  in if x `elem` cleanXs
     then cleanXs
     else x:cleanXs
--elimDups [1,3,4,1] = [1,3,4] or [3,4,1]

elimDupsQuick lst = elimDupsSorted (sort lst)
--can you do it quicker if you know the list is sorted?
elimDupsSorted :: Ord a => [a] -> [a]
elimDupsSorted [] = []
elimDupsSorted [x] = [x]
elimDupsSorted (x:xs) =
  let cleanXs = elimDupsSorted xs
  in if x == head xs
     then cleanXs
     else x:cleanXs
--elimDupsSorted [1,1,3,4,4,5,6,7,7] = [1,3,4,5,6,7]

gap :: [Int] -> Int
gap [] = error "no gap for an empty list."
gap (x:xs) = aux x x xs
  where aux :: Int -> Int -> [Int] -> Int
        aux max min [] = max - min
        aux max min (x:xs) 
          | x < min   = aux max x xs 
          | x > max   = aux x min xs
          | otherwise = aux max min xs

--gap lst = maximum lst - minimum lst
range :: [Int] -> (Int, Int)
range [] = error "aaah, no range empty bad why"
range [x] = (x,x)
range (x:xs) = 
  let (small, big) = range xs
  in if x < small
     then (x, big)
     else if x > big
          then (small, x)
          else (small, big)
gap2 lst = 
  let (small, big) = range lst
  in big-small

hoursToSchedule :: [(Int, Int)] -> Int
hoursToSchedule tasks = 
  let (hours, minutes) = aux tasks
  in if minutes > 0 then 1+hours else hours
aux [] = (0, 0)
aux ((h,m):ts) =
  let (hoursTs, minTs) = aux ts
  in if m+minTs > 60
     then (h + hoursTs+1, m + minTs - 60)
     else (h + hoursTs, m + minTs)

--hoursToSchedule [(5,25), (0,30) (1,15)] = 8
