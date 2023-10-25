module Calculator where
import Text.Read

data Operator = Plus | Minus | Divide | Times deriving (Eq, Show)
data Token = OpTok Operator | NumTok Double deriving (Eq, Show)
data Expr = OpExpr Operator Expr Expr | NumExpr Double deriving Eq, Show

--data Token = Plus | Minus | Divide | Times | Num Double deriving (Show, Eq)
--valid but we voted against it

lexer :: String -> Maybe [Token]
lexer str = sequence $ map lexWord (words str)

lexWord :: String -> Maybe Token
lexWord "+" = Just $ OpTok Plus
lexWord "-" = Just $ OpTok Minus
lexWord "*" = Just $ OpTok Times
lexWord "/" = Just $ OpTok Divide
lexWord x = fmap (NumTok) (readMaybe x)
  {-case readMaybe x of
    Just val -> Just $ NumTok val
    Nothing -> Nothing-}

numExprToks, opExprToks, rightExprToks, leftExprToks :: [Token]
numExprToks = [NumTok 79]
opExprToks = [OpTok Plus, NumTok 79, NumTok 4]
rightExprToks = [OpTok Minus, NumTok 4, OpTok Times, NumTok 8, NumTok 2]
leftExprToks = [OpTok Minus, OpTok Times, NumTok 8, NumTok 2, NumTok 4]

unsafeParser :: [Token] -> Expr
unsafeParser [] = error "Invalid expression: missing symbols."
unsafeParser (NumTok x:tokens) = NumExpr x
unsafeParser (OpTok op:tokens) = 
    let lft = unsafeParser tokens
        rgt = unsafeParser (drop (sizeOf lft) tokens)
    in OpExpr op lft rgt

unsafeParser2 :: [Token] -> Expr
unsafeParser2 tokens = 
  case aux tokens of
    (expr, [])   -> expr
    (expr, toks) -> error $ "Invalid expression: extra symbols "--(" ++ show toks ++ ")"
  where aux :: [Token] -> (Expr, [Token]) 
        aux [] = error "Invalid expression: missing symbols."
        aux (NumTok x:tokens) = (NumExpr x, tokens)
        aux (OpTok op:tokens) = 
                    let (lft, toksAfterLft) = aux tokens
                        (rgt, toksAfterRgt) = aux toksAfterLft
                    in (OpExpr op lft rgt, toksAfterRgt)

uglyParser :: [Token] -> Maybe Expr
uglyParser tokens = 
  case aux tokens of
    Just (expr, [])   -> Just expr
    Just (expr, toks) -> Nothing -- error $ "Invalid expression: extra symbols (" ++ show toks ++ ")"
    Nothing           -> Nothing
  where aux :: [Token] -> Maybe (Expr, [Token]) 
        aux [] = Nothing -- error "Invalid expression: missing symbols."
        aux (NumTok x:tokens) = Just (NumExpr x, tokens)
        aux (OpTok op:tokens) = 
            case aux tokens of
              Nothing -> Nothing
              Just (lft, toksAfterLft) ->
                  case aux toksAfterLft of
                    Nothing -> Nothing
                    Just (rgt, toksAfterRgt) -> Just (OpExpr op lft rgt, toksAfterRgt)


parser :: [Token] -> Maybe Expr
parser tokens = 
  case aux tokens of
    Just (expr, [])   -> Just expr
    Just (expr, toks) -> Nothing -- error $ "Invalid expression: extra symbols (" ++ show toks ++ ")"
  where aux :: [Token] -> Maybe (Expr, [Token]) 
        aux [] = Nothing -- error "Invalid expression: missing symbols."
        aux (NumTok x:tokens) = Just (NumExpr x, tokens)
        aux (OpTok op:tokens) = 
                    do (lft, toksAfterLft) <- aux tokens
                       (rgt, toksAfterRgt) <- aux toksAfterLft
                       Just (OpExpr op lft rgt, toksAfterRgt)

repl :: String -> Maybe Double
repl str = 
  do toks <- lexer str
     expr <- parser toks
     Just (eval expr) 

{-
 - repl :: String -> Maybe Double
repl str = 
  case lexer str of
    Nothing -> Nothing
    Just tokens -> 
      case parser tokens of
        Nothing -> Nothing
        Just expr -> Just $ eval expr
        -}

sizeOf :: Expr -> Int
sizeOf (NumExpr x) = 1
sizeOf (OpExpr op lft rgt) = 1 + sizeOf lft + sizeOf rgt

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
