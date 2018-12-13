isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome [x] = True
isPalindrome (h:t) = (h == (last t)) && isPalindrome (init t)
