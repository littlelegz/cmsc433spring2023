f x = x + x
-- Fat arrow (=>) implication arrow:
-- if Num a => a -> a 
data Color = Red | Blue | Green
instance Eq Color where
    Red == Red = True
    Blue == Blue = True
    Green == Green = True
    _ == _ = False

data Day = GoodDay | BadDay deriving (Show, Eq)

data Tree a = Empty | Branch a (Tree a) (Tree a) deriving (Show)
instance Eq a => Eq (Tree a) where
    Empty == Empty = True
    Branch x l r == Branch x' l' r' = x == x' && l == l' && r == r'
    _ == _ = False

-- Enums allow list comprehensions
list = [1..10]
list2 = [x | x <- [1..10], x `mod` 2 == 0]
list3 = [1.0,1.1..5.0] -- FromThenTO
list4 = [1.0,1.1..] -- FromThen
list5 = [1.0,2.0..] -- From

class M m where 
    g :: (a -> b) -> m a -> m b