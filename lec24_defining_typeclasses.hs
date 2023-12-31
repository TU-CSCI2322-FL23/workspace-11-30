{-# LANGUAGE FlexibleInstances, OverlappingInstances #-}

import Data.Char
import Calculator

class Boooo a where 
  scared :: a -> Bool
  tot :: a -> b -> b -> b
  tot test trick treat = if scared test then trick else treat
  treat :: a
  trick :: a

{-data Operator = Plus | Minus | Divide | Times deriving (Eq, Show)
data Token = OpTok Operator | NumTok Double deriving (Eq, Show)-}

instance Boooo Token where
  scared (OpTok op)    = op == Plus || op == Times
  scared (NumTok num) = scared num
  treat = NumTok 1
  trick = OpTok Divide 
--  trick = NumTok 0

instance Boooo Double where
  scared x = scared (round x :: Int)
  treat = 1
  trick = 0

instance Boooo Bool where
  scared b = b
  tot test trick treat = if test then trick else treat
  treat = True
  trick = False

instance Boooo Int where
  scared x = x /= 0
  treat = 1
  trick = 0

instance Boooo String where
  scared str = (map toLower str) `elem` ["true", "t", "yes", "y", "ghost", "zombie", "fogarty", "haskell", "boo", "booo", "boooo"]
  treat = "boo"
  trick = "yawn"


instance Boooo a => Boooo [a] where
  scared lst = all scared lst
  treat = [treat]
  trick = [treat, trick]

spooked :: Boooo a => [a] -> [a]
spooked lst = [x | x <- lst, scared x]

cAndy :: Boooo a => a -> a -> a
--cAndy jack sally = if (scared jack) then sally else jack
cAndy jack sally = tot jack sally jack

ortober :: Boooo a => a -> a -> a
ortober jack sally = if (scared jack) then jack else sally

noooot :: Boooo a => a -> a
noooot jack = if (scared jack) then trick else treat
