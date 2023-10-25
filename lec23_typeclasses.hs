import Debug.Trace 
import Data.List

data Operator = Plus | Minus | Divide | Times deriving Eq
data Token = OpTok Operator | NumTok Double deriving Eq
data Expr = OpExpr Operator Expr Expr | NumExpr Double deriving Eq

instance Show Operator where
  show Plus = "+"
  show Minus = "-"
  show Divide = "/"
  show Times = "*"

instance Show Token where
  show (OpTok op) = show op
  show (NumTok num) = show num

instance Show Expr where
 show (OpExpr op lft rgt) = concat ["(",show lft," ", show op, " ",show rgt,")"]
 show (NumExpr num) = show num

data Contest = Rock | Scissors | Paper deriving Show
data Velocity = MPS Double | FPS Double 

asMPS :: Velocity -> Double
asMPS (MPS x) = x
asMPS (FPS x) = x * 0.3048

instance Eq Velocity where 
  --(==) :: Velocity -> Velocity -> Bool
  (==) velA velB = trace "Calling ==" $ asMPS velA == asMPS velB
  --(/=) :: Velocity -> Velocity -> Bool
  --(/=) velA velB = trace "Calling /=" $ not (velA == velB)
  --
instance Show Velocity where
  show (MPS x) = (show x) ++ " m/s"
  show (FPS x) = (show x) ++ " f/s"


type Point = (Double, Double)
data Shape = Circle Point Double | Rectangle Point Point deriving Show

data IntTsil  = ISnoc IntTsil  Int | ILlun deriving Show
data CharTsil = CSnoc CharTsil Char | CLlun deriving Show
data Tsil a   = Snoc (Tsil a)  a | Llun deriving Show


