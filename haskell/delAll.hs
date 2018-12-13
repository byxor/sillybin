delAll :: Eq a => a -> [a] -> [a]
delAll _ [] = []
delAll x (h:t)
  | x == h    = delAll x t
  | otherwise = h : (delAll x t)
