{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilies     #-}

module PokemonTypeFamilies () where

class (Show a, Show (Move a)) => Pokemon a where
  data Move a :: *
  pickMove :: a -> Move a
