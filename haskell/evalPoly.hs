evalPoly :: Int -> [Int] -> Int
evalPoly x list = sum (evalPoly' x (reverse list))

evalPoly' :: Int -> [Int] -> [Int]
evalPoly' _ [] = []
evalPoly' x (h:t) = (h * (x^(length t))) : (evalPoly' x t)
