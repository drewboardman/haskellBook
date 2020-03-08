module Foldable where

data Maybe2 a = Just2 a | Nothing2 deriving (Eq, Ord, Show)

instance Foldable Maybe2 where
  foldr _ agg (Nothing2) = agg
  foldr f agg (Just2 x) = f x agg
