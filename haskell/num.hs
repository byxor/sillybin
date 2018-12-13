num :: Eq a => a -> [a] -> Int
num _ [] = 0
num x (h:t) = (if (x == h) then 1 else 0) + (num x t)
