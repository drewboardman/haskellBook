module Chapter4 where

data Mood = Blah | Woot
  deriving (Show)

switcher :: Mood -> Mood
switcher Woot = Blah
switcher Blah = Woot
