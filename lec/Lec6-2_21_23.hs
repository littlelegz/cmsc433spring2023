import Test.HUnit

{- 
foldr :: (z -> e -> e)
        -> e
        -> [z]
        -> e
-----
foldr :: (a -> ([c] -> [c]) -> ([c] -> [c])) -- inductive case (step)
        -> ([c] -> [c])                      -- base case (done)
        -> [a]                               -- list to fold over
        -> ([c] -> [c])                      -- result
-}

f :: (a -> b -> b) -> [a] -> [b] -> [b]
f comb l1 l2 = foldr step (\c -> c) l1 l2 -- embedded lambda which returns first arg
  where step a rst = \lst -> case lst of -- step function takes l2 and folds over it
            [] -> []
            (x:xs) -> (comb a x):(rst xs) -- 

            
tf :: Test
tf = "tf" ~: TestList [ f (+) [1,2,3] [4,5,6,7] ~?= [5,7,9,7],
  f (+) [4,5,6,7] [1,2,3] ~?= [5,7,9],
  f (:) ['a','b','c'] ["d","e"] ~?= ["ad","be"],
  f (:) ['d','e'] ["a","b","c"] ~?= ["da","eb","c"] ]

data Chew e = Han e e e 
    | Bowcaster
    | BestFriend (Chew e)

foldChew :: (e -> b -> b) -> b -> Chew e -> b
foldChew f acc (Han x y z) = f x (f y (f z acc))
foldChew f acc Bowcaster = acc
foldChew f acc (BestFriend c) = foldChew f acc c