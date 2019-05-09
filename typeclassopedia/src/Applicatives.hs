{-# LANGUAGE InstanceSigs        #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Applicatives () where

newtype ZipList a = ZipList { getZipList :: [a] }

instance Functor ZipList where
  fmap :: (a -> b) -> ZipList a -> ZipList b
  fmap func ziplist = res where
    mapped = case getZipList ziplist of
      [] -> []
      (x:xs) -> func x : fmap func xs
    res = ZipList mapped

instance Applicative ZipList where
  pure :: a -> ZipList a
  pure = undefined

  (<*>) :: ZipList(a -> b) -> ZipList a -> ZipList b
  (ZipList gs) <*> (ZipList xs) = ZipList (zipWith ($) gs xs)
  -- the signature of zipWith is `zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]`
  -- so this is just saying, take 2 lists
  -- gs: list of functions that makes an a -> b
  -- xs: list of a's
  -- the ($) just applies the "g" function to the "a"
