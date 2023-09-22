lst = [7,3,1,5]
lstB = [2,5,6]

ans = if 7 `elem` lst then "yay" else "boo"
--pattern matching
(lstHead:lstTail) = lst

notEmpty [] = False
notEmpty (x:xs) = True

hundredNumbers = [1..100]

naturals = [0..]

evens = [2,4..100]
evens2 = [x | x <- hundredNumbers, even x]
evens3 = [2 * x | x <- [1..50] ]

lstC = [-2,3,-8, -4, 10]
absC = [abs x | x <- lstC]
absList lst = [abs x | x <- lst]

intersectBC = [x | x <- lstB, x `elem` lstC]
crossBC = [x | x <- lstB, x <- lstC]

