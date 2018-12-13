myProduct :: [Int] -> Int
myProduct [] = 1
myProduct (h:t) = h * (myProduct t)
