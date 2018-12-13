doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
                        then x
                        else x*2

doubleSmallNumber' x = (if x > 100 then x else x*2) + 1

conanO'Brien = "It's a-me, Conan O'Brien!"

numbers = [1,2,3,4,5]

one = head numbers

five = last numbers

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

nouns = ["hobo", "frog", "pope"]
adjectives = ["lazy", "grouchy", "scheming", "darn"]
describedThings = [a ++ " " ++ n | a <-adjectives, n <- nouns]

length' iterable = sum [1 | _ <- iterable]
