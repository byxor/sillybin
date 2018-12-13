sumPoly :: [Int] -> [Int] -> [Int]
sumPoly list1 list2 = [x + y | (x, y) <- (zipWithDefault list1 list2 0)]


zipWithDefault :: [Int] -> [Int] -> Int -> [(Int, Int)]
zipWithDefault [] [] _ = []
zipWithDefault [] (h:t) x = (x, h) : zipWithDefault [] t x
zipWithDefault (h:t) [] x = (h, x) : zipWithDefault t [] x
zipWithDefault (h1:t1) (h2:t2) x = (h1, h2) : zipWithDefault t1 t2 x
