numSorted :: (Ord a, Eq a) => a -> [a] -> Int
numSorted _ [] = 0
numSorted x (h:t)
  | h > x     = 0
  | x == h    = 1 + (numSorted x t)
  | otherwise = numSorted x t
