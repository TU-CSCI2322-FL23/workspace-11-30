-- Input: strings
inputOne, inputTwo, inputThree :: String
inputOne   = "+ 7 * 3 2"
inputTwo   = "- + 79 4 * 8 2"
inputThree = "* + 3 - 79 8 2"

data Operator = Plus | Minus | Divide | Times deriving (Show, Eq)
data Token = Op Operator | Num Double deriving (Show, Eq)

--data Token = Plus | Minus | Divide | Times | Num Double deriving (Show, Eq)

lexer :: String -> [Token]
lexer str = map lexWord (words str)
  where lexWord :: String -> Token

--lexWord "7" = Num 7
--lexWord "+" = Op Plus
