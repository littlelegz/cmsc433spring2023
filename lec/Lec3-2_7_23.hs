module Lec3 where

twice :: (a -> a) -> a -> a
twice f x = f (f x)

twice' f = f . f

g = twice (* (2 :: Int))