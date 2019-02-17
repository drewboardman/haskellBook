module Chapter4 where

awesome = ["Papuchon", "curry", ":)"]

also = ["Quake", "The Simons"]

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

f :: (a,b) -> (c,d) -> ((b,d), (a,c))
f x y = ((snd x, snd y), (fst x, fst y))
