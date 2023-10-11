module Calculator where

data Operator = Plus | Minus | Divide | Times deriving (Show, Eq)
data Token = OpTok Operator | NumTok Double deriving (Show, Eq)

--data Token = Plus | Minus | Divide | Times | Num Double deriving (Show, Eq)
--valid but we voted against it

lexer :: String -> [Token]
lexer str = map lexWord (words str)

lexWord :: String -> Token
lexWord "+" = OpTok Plus
lexWord "-" = OpTok Minus
lexWord "*" = OpTok Times
lexWord "/" = OpTok Divide
lexWord x = NumTok (read x)


--data Operator = Plus | Minus | Divide | Times deriving (Show, Eq)
data Expr = OpExpr Operator Expr Expr | NumExpr Double deriving Show

eval :: Expr -> Double
eval (NumExpr x) = x
eval (OpExpr Plus lft rgt) = (eval lft) + (eval rgt)
eval (OpExpr Minus lft rgt) = (eval lft) - (eval rgt)
eval (OpExpr Divide lft rgt) = (eval lft) / (eval rgt)
eval (OpExpr Times lft rgt) = (eval lft) * (eval rgt)

{- Other ways to do eval: case expression for pattern matching, or a helper function to evaluate an
 - operator.
 
eval (OpExpr op left right) = 
  let leftV = eval lft
      rightV = eval rgt
  in case op of
        Plus -> leftV + rightV
        Minus -> leftV - rightV
        Divide -> leftV / rightV
        Times -> leftV * rightV

eval (OpExpr op lft rgt) = (evalOp op) (eval lft) (eval rgt)

evalOp :: Operator -> (Double -> Double -> Double)
evalOp Plus = (+) 
evalOp Minus = (-)
evalOp Times = (*)
evalOp Divide = (/)
-}
