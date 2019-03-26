{-# LANGUAGE DeriveGeneric       #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies        #-}
-- {-# LANGUAGE OverloadedStrings   #-}

module HigherKinded () where

import           Data.Functor.Identity (Identity)
import           GHC.Generics          (Generic)

-- Using the HKD type family means that GHC will automatically erase any
-- Identity wrappers in our representations
type family HKD f a where
  HKD Identity a = a
  HKD f a        = f a

data Person' f = Person'
  { pName :: HKD f String
  , pAge  :: HKD f Int
  } deriving (Generic)

type Person = Person' Identity

validate :: Person' Maybe -> Maybe Person
validate (Person' mname mage) =
  Person' <$> mname <*> mage
