module Fortunes where

import Data.List
import Data.Char

main :: IO ()
main = do
  putStr "Please tell me your name: "
  name <- getLine
  contents <- (readFile "fortunes.txt")
  let fortunes = lines contents
  putStr $ "Hello, " ++ name ++ ", your fortune is: "
  putStrLn $ pickFortune fortunes name

pickFortune :: [String] -> String -> String
pickFortune fortunes name =
  let index = sum $ map ord name
  in (cycle fortunes) !! index
