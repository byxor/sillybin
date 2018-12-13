isSum :: Int -> Int -> Int -> Bool
isSum a b c
  | a + b == c = True
  | a + c == b = True
  | b + c == a = True
  | otherwise = False
