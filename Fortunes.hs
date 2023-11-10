module Fortunes where

import Data.List
import Data.Char
import System.Environment
import System.IO

main :: IO ()
main = do
  args <- getArgs
  {-let fname = case args of
                [] -> "fortunes.txt"
                (x:xs) -> x-}
  let fname = if null args then "fortunes.txt" else head args
  name <- prompt "Please tell me your name: "
  contents <- (readFile fname)
  let fortunes = lines contents
  putStr $ "Hello, " ++ name ++ ", your fortune is: "
  putStrLn $ pickFortune fortunes name
  resp <- prompt "Do you want another fortune?"
  if (map toLower resp) `elem` ["y", "yes", "sure", "okay"]
  then do 
    putStr $ "Your fortune is: "
    putStrLn $ pickFortune fortunes (name++"1")
  else return ()

prompt :: String -> IO String
prompt question = 
  do putStr question
     hFlush stdout
     resp <- getLine
     return resp


pickFortune :: [String] -> String -> String
pickFortune fortunes name =
  let index = sum $ map ord name
  in (cycle fortunes) !! index
