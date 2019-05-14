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
  pure a = ZipList [a]

  (<*>) :: ZipList(a -> b) -> ZipList a -> ZipList b
  (ZipList gs) <*> (ZipList xs) = ZipList (zipWith ($) gs xs)
  -- the signature of zipWith is `zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]`
  -- so this is just saying, take 2 lists
  -- gs: list of functions that makes an a -> b
  -- xs: list of a's
  -- the ($) just applies the "g" function to the "a"

newtype AppMaybe a = AppMaybe (Maybe a)

instance Functor AppMaybe where
  fmap :: (a -> b) -> AppMaybe a -> AppMaybe b
  fmap _ (AppMaybe Nothing) = AppMaybe Nothing
  fmap f (AppMaybe (Just x)) = AppMaybe (Just (f x))

instance Applicative AppMaybe where
  pure :: a -> AppMaybe a
  pure x = AppMaybe (Just x)

  (<*>) :: AppMaybe (a -> b) -> AppMaybe a -> AppMaybe b
  (AppMaybe Nothing) <*> (AppMaybe Nothing) = AppMaybe Nothing
  (AppMaybe Nothing) <*> (AppMaybe (Just _)) = AppMaybe Nothing
  (AppMaybe (Just _)) <*> (AppMaybe Nothing) = AppMaybe Nothing
  (AppMaybe (Just f)) <*> (AppMaybe (Just x)) = AppMaybe (Just (f x))

sequenceAL :: Applicative f => [f a] -> f [a]
sequenceAL [] = pure []
sequenceAL fas = pure [a | f a <- fas]
