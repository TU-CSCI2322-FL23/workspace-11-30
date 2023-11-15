module Fortunes where

import Data.List
import Data.Char
import System.Environment
import System.IO
import System.Console.GetOpt

data Flag = Help | Quick | Number String | Start String deriving (Eq, Show)
options :: [OptDescr  Flag]
options = [ Option ['h'] ["help"] (NoArg Help) "Print usage information and exit."
          , Option ['q'] ["quick","quiet"] (NoArg Quick) "Print the fortunes and exit."
          , Option ['n'] ["num"] (ReqArg Number "<num>") "Print <num> fortunes at a time."
          , Option ['s'] ["start"] (ReqArg Start "<num>") 
                "Start at fortune <num>. Defaults to value based on name, or 1 if quick mode."
          ]

main :: IO ()
main = 
  do args <- getArgs
     let (flags, inputs, errors) =  getOpt Permute options args
     {-let fname = case args of
                   [] -> "fortunes.txt"
                   (x:xs) -> x-}
     let fname = if null inputs then "fortunes.txt" else head inputs
     if Help `elem` flags
     then putStrLn $ usageInfo "Fortunes [options] [file]" options
     else 
       do contents <- (readFile fname)
          let fortunes = lines contents
          if Quick `elem` flags
            then tellFortunesQuick flags fortunes
            else 
              do name <- prompt "Please tell me your name:"
                 tellFortunes name fortunes


tellFortunesQuick :: [Flag] -> [String] -> IO ()
tellFortunesQuick flags fortunes =
  let index = startOfFlags flags
  in putStrLn $ pickFortune fortunes index

startOfFlags :: [Flag] -> Int
startOfFlags [] = 1
startOfFlags (Start x:_) = read x
startOfFlags (f:fs) = startOfFlags fs

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
