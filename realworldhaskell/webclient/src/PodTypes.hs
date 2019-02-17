module PodTypes where

data Podcast = Podcast
  { castId  :: Integer -- Numeric ID for this podcast
  , caseUrl :: String -- Its feed URL
  } deriving (Eq, Show, Read)

data Episode = Episode
  { epId   :: Integer
  , epCast :: Podcast
  , epURL  :: String
  , epDone :: Bool
  } deriving (Eq, Show, Read)
