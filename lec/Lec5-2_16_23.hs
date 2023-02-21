import Test.HUnit

data Tree a = Empty | Node a (Tree a) (Tree a)
              deriving (Show, Eq)

main :: IO ()
main = do
  runTestTT tf
  return ()

mapTree :: (a -> b) -> Tree a -> Tree b
mapTree f Empty = Empty
mapTree f (Node x l r) = Node (f x) (mapTree f l) (mapTree f r)

treeFold :: (a -> b -> b -> b) -> b -> Tree a -> b
treeFold f acc Empty = acc
treeFold f acc (Node x l r) = f x (treeFold f acc l) (treeFold f acc r)

f :: (a -> b -> b) -> [a] -> [b] -> [b]
f g xs ys = foldr step done xs ys 
    where done [] = []
          done yz = yz
          step x acc [] = [] -- acc is rest of constructed function listo
          step x acc (y:ys) = (g x y):(acc ys)

tf :: Test
tf = "tf" ~: TestList [ f (+) [1,2,3] [4,5,6,7] ~?= [5,7,9,7],
  f (+) [4,5,6,7] [1,2,3] ~?= [5,7,9],
  f (:) ['a','b','c'] ["d","e"] ~?= ["ad","be"],
  f (:) ['d','e'] ["a","b","c"] ~?= ["da","eb","c"] ]