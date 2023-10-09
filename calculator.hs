-- Input: strings
inputOne, inputTwo, inputThree :: String
inputOne   = "+ 7 * 3 2"
inputTwo   = "- + 79 4 * 8 2"
inputThree = "* + 3 - 79 8 2"

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

tokensOne, tokensTwo, tokensThree :: [Token]
tokensOne = [OpTok Plus,NumTok 7.0,OpTok Times,NumTok 3.0,NumTok 2.0]
tokensTwo = [OpTok Minus,OpTok Plus,NumTok 79.0,NumTok 4.0,OpTok Times,NumTok 8.0,NumTok 2.0]
tokensThree = [OpTok Times,OpTok Plus,NumTok 3.0,OpTok Minus,NumTok 79.0,NumTok 8.0,NumTok 2.0]

--data Operator = Plus | Minus | Divide | Times deriving (Show, Eq)
data Expr = OpExpr Operator Expr Expr | NumExpr Double deriving Show

treeZero, treeOne, treeTwo, treeTwoA, treeTwoB, treeThree :: Expr
treeZero = NumExpr 10.0
treeOne = OpExpr Plus (NumExpr 7.0) (OpExpr Times (NumExpr 3) (NumExpr 2))
treeTwo = OpExpr Minus treeTwoA treeTwoB 
treeTwoA = (OpExpr Plus (NumExpr 79.0) 
                        (NumExpr 4.0))
treeTwoB = (OpExpr Times (NumExpr 8.0) 
                         (NumExpr 2.0))
treeThree = OpExpr Times (OpExpr Plus (NumExpr 3.0)
                                      (OpExpr Minus (NumExpr 79.0)
                                                    (NumExpr 8.0)))
                         (NumExpr 2.0)


eval :: Expr -> Double
eval (NumExpr x) = x
eval (OpExpr Plus lft rgt) = (eval lft) + (eval rgt)
eval (OpExpr Minus lft rgt) = (eval lft) - (eval rgt)
eval (OpExpr Divide lft rgt) = (eval lft) / (eval rgt)
eval (OpExpr Times lft rgt) = (eval lft) * (eval rgt)

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
