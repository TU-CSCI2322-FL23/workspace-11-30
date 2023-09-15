import Debug.Trace

quickSort [] = []
quickSort (pivot:rest) = 
  let smaller = [ x | x <- rest, x <= pivot ]
      bigger = [ x | x <- rest, x > pivot ]
  in traceShow (pivot:rest,"split into", smaller,pivot,bigger) $ 
     (quickSort smaller) ++ [pivot] ++ (quickSort bigger)


myGcd x y  
  | x == y    = x
  | x < y     = traceShow (x,y)$  myGcd y x
  | otherwise = traceShow (x,y,x-y) $ myGcd y (x-y)

myRev :: [a] -> [a]
myRev [] = []
myRev (x:xs) = (myRev xs) ++ [x]

quickRev lst = aux lst []
  where aux [] reversed = reversed
        aux (x:xs) reversed = aux xs (x:reversed)

hanoi 0 s r t = []
hanoi n s r t =
  hanoi (n-1) s t r ++ [(n,s,t)] ++ hanoi (n-1) r s t
