import Calculator 
-- Examples from the lexer and evaluator.

inputOne, inputTwo, inputThree :: String
inputOne   = "+ 7 * 3 2"
inputTwo   = "- + 79 4 * 8 2"
inputThree = "* + 3 - 79 8 2"

tokensOne, tokensTwo, tokensThree :: [Token]
tokensOne = [OpTok Plus,NumTok 7.0,OpTok Times,NumTok 3.0,NumTok 2.0]
tokensTwo = [OpTok Minus,OpTok Plus,NumTok 79.0,NumTok 4.0,OpTok Times,NumTok 8.0,NumTok 2.0]
tokensThree = [OpTok Times,OpTok Plus,NumTok 3.0,OpTok Minus,NumTok 79.0,NumTok 8.0,NumTok 2.0]

treeZero, treeOne, treeTwo, treeTwoA, treeTwoB, treeThree :: Expr
treeZero = NumExpr 10.0
treeOne = OpExpr Plus (NumExpr 7.0) (OpExpr Times (NumExpr 3) (NumExpr 2))
treeTwo = OpExpr Minus treeTwoA treeTwoB 
treeTwoA = (OpExpr Plus (NumExpr 79.0) (NumExpr 4.0))
treeTwoB = (OpExpr Times (NumExpr 8.0) (NumExpr 2.0))
treeThree = OpExpr Times (OpExpr Plus (NumExpr 3.0)
                                      (OpExpr Minus (NumExpr 79.0)
                                                    (NumExpr 8.0)))
                         (NumExpr 2.0)


-- Examples for parsing - try these in order before you work on tokensOne/Two/Three

numExpr, opExpr, rightExpr, leftExpr :: String
numExpr = "79"
opExpr = "+ 79 4"
rightExpr = "- 4 * 8 2"
leftExpr = "- * 8 2 4"

numExprToks, opExprToks, rightExprToks, leftExprToks :: [Token]
numExprToks = [NumTok 79]
opExprToks = [OpTok Plus, NumTok 79, NumTok 4]
rightExprToks = [OpTok Minus, NumTok 4, OpTok Times, NumTok 8, NumTok 2]
leftExprToks = [OpTok Minus, OpTok Times, NumTok 8, NumTok 2, NumTok 4]

numExprTree = NumExpr 79
opExprTree = OpExpr Plus (NumExpr 79) (NumExpr 4)
rightExprTree = OpExpr Minus (NumExpr 4) (OpExpr Times (NumExpr 8) (NumExpr 2))
leftExprTree = OpExpr Minus (OpExpr Times (NumExpr 8) (NumExpr 2)) (NumExpr 4)
