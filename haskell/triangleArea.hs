triangleArea :: Float -> Float -> Float -> Float
triangleArea a b c = triangleArea' a b c ((a + b + c) / 2)

triangleArea' a b c s = sqrt (s * (s - a) * (s - b) * (s - c))
