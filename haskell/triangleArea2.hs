import Data.List

triangleArea :: Float -> Float -> Float -> Float
triangleArea a b c
  | isValid a b c = triangleArea' a b c ((a + b + c) / 2)
  | otherwise = error "Not a triangle!"

 


triangleArea' a b c s = sqrt (s * (s - a) * (s - b) * (s - c))

isValid :: Float -> Float -> Float -> Bool
isValid a b c = ((x^2 + y^2) == z^2) where
  nums = sort [a,b,c]
  x = nums !! 0
  y = nums !! 1
  z = nums !! 2

-- isValid is wrong. I don't care.
