shortest :: [[a]] -> [a]
shortest [] = []
shortest [list] = list
shortest (h:t)
  | (length h) < (length (shortest t)) = h
  | otherwise = shortest t
