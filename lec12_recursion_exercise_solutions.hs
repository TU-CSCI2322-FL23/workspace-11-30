insertionSort :: Ord a => [a] -> [a]
insertionSort [] = []
insertionSort (x:xs) = insert x (insertionSort xs)

insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x lst@(y:ys) = 
  if x < y 
  then x:lst
  else y:(insert x ys)

append []     ys = ys
append (x:xs) ys = x : (xs `append` ys)

dropEveryNth :: Int -> [a] -> [a]
dropEveryNth n lst = aux n lst
  where aux m [] = []
        aux 1 (x:xs) = aux n xs
        aux m (x:xs) = x:(aux (m-1) xs)

dropEveryNth2 n lst =
  let front = take (n-1) lst
      rest = dropEveryNth2 n (drop n lst)
  in front ++ rest
