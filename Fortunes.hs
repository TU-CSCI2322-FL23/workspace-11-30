module Fortunes where

import Data.List
import Data.Char
import System.Environment
import System.IO

main :: IO ()
main = 
  do args <- getArgs
     {-let fname = case args of
                   [] -> "fortunes.txt"
                   (x:xs) -> x-}
     let fname = if null args then "fortunes.txt" else head args
     if "--help" `elem` args
     then putStrLn "Fortunes <filename>\n Interactive fortune teller!"
     else 
      do contents <- (readFile fname)
         name <- prompt "Please tell me your name:"
         let fortunes = lines contents
         tellFortunes name fortunes

tellFortunes :: String -> [String] -> IO ()
tellFortunes name fortunes = aux (indexOfName name)
  where aux index = 
          do putStr $ "Hello, " ++ name ++ ", your fortune is: "
             putStrLn $ pickFortune fortunes index
             resp <- prompt "Do you want another fortune?"
             if (map toLower resp) `elem` ["y", "yes", "sure", "okay"]
             then aux (index+1)
             else return ()

prompt :: String -> IO String
prompt question = 
  do putStr (question++" ")
     hFlush stdout
     resp <- getLine
     return resp

indexOfName :: String -> Int
indexOfName name = sum $ map ord name

pickFortune :: [String] -> Int -> String
pickFortune fortunes index = (cycle fortunes) !! index
