module Four where

awesome :: [String]
awesome = ["Papuchon", "curry", ":)"]

also :: [String]
also = ["Quake", "The Simons"]

allAwesome :: [[String]]
allAwesome = [awesome, also]

data Mood
  = Blah
  | Woot
  deriving (Show)

switcher :: Mood -> Mood
switcher Woot = Blah
switcher Blah = Woot

palindromer :: String -> Bool
palindromer x = x == reverse x

absoluter :: Integer -> Integer
absoluter x = if x < 0 then negate x else x

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))
