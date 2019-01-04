module Plural_Test where

import Plural( pluralise )
import Test.HUnit


testPluralise = TestList
  ((section "Empty strings remain empty"
    [("", "")]) ++

   (section "Plurals remain plural"
    [("cats",         "cats"),
     ("dogs",         "dogs"),
     ("balloons",     "balloons"),
     ("parties",      "parties"),
     ("truckdrivers", "truckdrivers")]) ++

   (section "Singulars become plural"
    [("cat",     "cats"),
     ("dog",     "dogs"),
     ("balloon", "balloons"),
     
     ("party", "parties"),
     ("story", "stories")]))
  
  where section = testPluraliseSection


testPluraliseSection :: String -> [(String, String)] -> [Test]
testPluraliseSection _ [] = []
testPluraliseSection desc ((word, expected) : cases) =
  (desc ~: expected ~=? (pluralise word)) :
  (testPluraliseSection desc cases)


main = runTestTT testPluralise
