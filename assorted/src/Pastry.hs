module Pastry where

-- sum type
data Pastry
  = Turnover
  | Macaroon
  | Brownie
  | Cookie

-- product type
data Person = Person
  { firstName :: String
  , lastName  :: String
  , age       :: Int
  , height    :: Float
  , phone     :: String
  , flavor    :: String
  }
