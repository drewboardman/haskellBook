{-# LANGUAGE DeriveFunctor       #-}
{-# LANGUAGE InstanceSigs        #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Monad () where

newtype ListMonad a = ListMonad [a] deriving (Functor)

instance Applicative ListMonad where
  pure :: a -> ListMonad a
  pure x = ListMonad [x]

  (<*>) :: ListMonad (a -> b) -> ListMonad a -> ListMonad b
  _ <*> ListMonad [] = ListMonad []
  ListMonad gs <*> ListMonad xs = ListMonad [g x | x <- xs, g <- gs]

instance Monad ListMonad where
  (>>=) :: ListMonad a -> (a -> ListMonad b) -> ListMonad b
  ListMonad [] >>= _ = ListMonad []
  ListMonad xs >>= g = join $ [g x | x <- xs]
