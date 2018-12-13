{-# OPTIONS_GHC -Wall #-}

delFirst :: Eq a => a -> [a] -> [a]
delFirst _ [] = []
delFirst x (h:t)
  | x == h    = t
  | otherwise = h : (delFirst x t)
