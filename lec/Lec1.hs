x = 41 :: Integer

funk :: Int -> Int -> Int
funk x y = let res = fun2 "test" in x + (y * 21)

fun2 :: String -> IO ()
fun2 str = putStrLn str

main :: IO ()
main = do
    putStr "Enter Name:"
    name <- getLine
    putStr ("Hello, " ++ name) 