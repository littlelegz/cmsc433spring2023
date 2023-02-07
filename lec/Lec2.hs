{- 
    Left nested list of appends is inefficient, make API to ensure that any user interaction with a list is right nested
-}

type DList a = [a] -> [a]
fromList :: [a] -> DList a
fromList xs = (\ys -> xs ++ ys)

toList :: DList a -> [a]
toList xs = xs []

cons :: a -> DList a -> DList a
cons x xs = (\ys -> x : xs ys)

empty :: DList a
empty = (\ys -> ys)