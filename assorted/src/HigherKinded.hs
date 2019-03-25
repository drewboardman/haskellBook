{-# LANGUAGE DeriveGeneric       #-}
{-# LANGUAGE ScopedTypeVariables #-}

module HigherKinded () where

import           GHC.Generics

data Person = Person
  { pName    :: String
  , pAge     :: Int
  , pAddress :: String
  , pSSN     :: Int
  } deriving (Generic)

-- here's a datatype to handle improper user input
data MaybePerson = MaybePerson
  { mpName    :: Maybe String
  , mpAge     :: Maybe Int
  , mpAddress :: Maybe String
  , mpSSN     :: Maybe Int
  } deriving (Generic)

validate2 :: MaybePerson -> Maybe Person
validate2 (MaybePerson mn ma maddr mssn) = undefined
