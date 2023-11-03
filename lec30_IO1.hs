main = do name <- getLine
          foo <- putStrLn $ "hello " ++ name
          putStrLn (show foo)
