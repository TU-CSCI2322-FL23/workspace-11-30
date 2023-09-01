{- CSCI-2322
 - Functions and List Comprehensions

 - Copy this file to your home directory, and complete it. I suggest you work out your examples in
 - ghci first, and then copy them.
 -}

-- 1. Define the function firstTwoTup :: [a] -> (a,a) that takes a list and returns the tuple of the first two elements. 
firstTwoTup :: [a] -> (a,a)
firstTwoTup = undefined

-- 2. Define the function collatzEsque :: Integer -> Integer. If the integer is negative, multiply
-- it by (-2), and if it is positive subtract 10 and multiply by (-1). Thus collatzEsque 6 should
-- return 4, while collatzEsque (-5) should return 10
collatzEsque :: Integer -> Integer
collatzEsque = undefined

-- 3. Create the list pythag :: [(Integer, Integer, Integer)] of all Pythagorean triples below 100:
-- integers (a,b,c) such that a^2+b^2=c^2 a. Create a list of all triples (a,b,c) from 1 to 100. 
--     b. Use length to ensure there are a million elements.
--     c. Add predicates to ensure they obey the right-triangle equality
--     d. There are 52 pythagorean triples. If your list has more, figure out why and fix it.
--     e. Extra fun: remove triples that are multiples of another: i.e. (6,8,10) and (3,4,5),

pythag :: [(Integer, Integer, Integer)]
pythag = undefined

-- 4. Write a function divisors :: Integer -> [Integer] that returns the divisors of an integer
-- input, not counting 1 or itself.  a. In GHCI, define a constant x = 24
--     b. Use a list comprehension to find all integers from 2 to 23 that evenly divide x. The `mod` function will help.
--     c. In the text file, create a function divisors x that uses the same list comprehension. Load
--     the file into GHCI and ensure it works.
divisors :: Integer -> [Integer]
divisors = undefined

-- 5. A number is "perfect" if it is equal to the sum of all its divisors (counting 1 but not
-- counting itself). Write a function isPerfect :: Integer -> Bool that takes a number and returns
-- true if it is perfect.
isPerfect :: Integer -> Bool
isPerfect = undefined


-- 6. Write a function isPrime :: Integer -> Bool that determines if a number is prime.
isPrime :: Integer -> Bool
isPrime = undefined

-- 7. Define the infinite list perfects of all perfect numbers and primes of all prime numbers.
perfects, primes :: [Integer]
perfects = undefined
primes = undefined

-- 8. Define a function flatten :: [[a]] -> [a] that takes a list of lists, and returns the
-- flattened list containing all the elements of the sublist in order.  a. It may help to start with
--      a. concrete list lst = [[7,3,2],[1,5],[],[9]
--      b. Then use list comprehensions to define the flattened list for lst.
--      c. Finally, abstract it into a function.
flatten :: [[a]] -> [a]
flatten = undefined

