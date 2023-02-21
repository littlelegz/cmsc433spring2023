import System.Environment
import Control.Applicative ((<|>))
import Data.Maybe (fromMaybe)

k :: String -> IO String -> IO String
k = flip const

funcs = [flip k getLine, flip k getContents, getEnv, \s -> putStr s >>= (pure . show)]

[g, h] = [flip foldr ([]) . ((:) .), map]

fun a b = zip b (drop a (cycle b))
gun n   = g (\c -> fromMaybe c (lookup c (fun n ['A'..'Z']) <|> lookup c (fun n ['a'..'z'])))

main = do
  [s] <- traverse id [f $ gun 13 "HFRE" | (3, f) <- zip [1..] funcs]
  print (gun 42 s)
