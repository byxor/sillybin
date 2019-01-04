module Plural( pluralise ) where

import Data.String.Utils( endswith )

pluralise :: String -> String
pluralise "" = ""
pluralise word
  | (endswith "y" word) = (init word) ++ "ies"
  | (last word) == 's'  = word
  | otherwise           = word ++ "s"
