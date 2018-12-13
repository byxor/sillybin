import Data.Char

stringToUpper :: String -> String
stringToUpper s = map toUpper s

delFirst :: Eq a => a -> [a] -> [a]
delFirst x [] = []
delFirst x (head:tail)
    | head == x = tail
    | otherwise = head : (delFirst x tail)

numSorted :: Ord a => a -> [a] -> Int
numSorted x [] = 0
numSorted x (head:tail) = (if (x == head) then 1 else 0) + numSorted x tail

repAll :: Eq a => a -> a -> [a] -> [a]
repAll x y [] = []
repAll x y (head:tail) = (if (x == head) then y else head) : (repAll x y tail)
