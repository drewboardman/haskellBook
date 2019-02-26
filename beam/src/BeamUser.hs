{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE GADTs                 #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE StandaloneDeriving    #-}
{-# LANGUAGE TypeApplications      #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE TypeSynonymInstances  #-}

module BeamUser
  ( thing
  ) where

import           Data.Text              (Text)
import           Database.Beam
import           Database.Beam.Sqlite
import           Database.SQLite.Simple

-- convention is that table types are suffixed with a T
data UserT f = User -- constructor has same name as table, but without the T
  { _userEmail     :: Columnar f Text -- the reason there is an _underscore is because of `lens`
  , _userFirstName :: Columnar f Text
  , _userLastName  :: Columnar f Text
  , _userPassword  :: Columnar f Text
  } deriving (Generic)

type User = UserT Identity

type UserId = PrimaryKey UserT Identity

deriving instance Show User

deriving instance Eq User

-- Apparently this will just write all the methods for us at compile time
-- This is bc of DeriveGeneric and DefaultSignatures
-- ** all beam tables need to implement the Beamable and Table subclasses
instance Beamable UserT

instance Table UserT where
  data PrimaryKey UserT f = UserId (Columnar f Text)
                            deriving Generic
  primaryKey = UserId . _userEmail

instance Beamable (PrimaryKey UserT)

-- make a table for the database
data ShoppingCartDb f = ShoppingCartDb
  { _shoppingCartUsers :: f (TableEntity UserT)
  } deriving (Generic)

instance Database be ShoppingCartDb

shoppingCartDb :: DatabaseSettings be ShoppingCartDb
shoppingCartDb = defaultDbSettings

thing :: IO ()
thing = do
  conn <- open "shoppingcart.db"
  runBeamSqliteDebug putStrLn conn $
    runInsert $ {- for debug output -}
    insert (_shoppingCartUsers shoppingCartDb) $
    insertValues
      [ User
          "james@example.com"
          "James"
          "Smith"
          "b4cc344d25a2efe540adbf2678e2304c" {- james -}
      , User
          "betty@example.com"
          "Betty"
          "Jones"
          "82b054bd83ffad9b6cf8bdb98ce3cc2f" {- betty -}
      , User "sam@example.com" "Sam" "Taylor" "332532dcfaa1cbf61e2a266bd723612c" {- sam -}
      ]
