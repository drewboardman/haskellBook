{-# LANGUAGE InstanceSigs        #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Functors () where

    -- Implement Functor instances for Either e and ((->) e).
data Either' a b = Left' a | Right' b deriving (Eq, Show, Ord)
instance Functor (Either' e) where
  fmap func (Right' e) = Right' (func e)
  fmap _ (Left' e)     = Left' e

newtype Foo a b = Foo (a -> b)
instance Functor (Foo a) where
  fmap f (Foo g) = Foo (f . g)

    -- Implement Functor instances for ((,) e) and for Pair, defined as
    -- data Pair a = Pair a a
newtype Pair1 a b = Pair1 (a,b)
instance Functor (Pair1 a) where
  fmap :: (b -> c) -> Pair1 a b -> Pair1 a c
  fmap f (Pair1 (x, y)) = Pair1 (x, f y)

data Pair2 a = Pair2 a a
instance Functor Pair2 where
  fmap :: (a -> b) -> Pair2 a -> Pair2 b
  fmap f (Pair2 x y) = Pair2 (f x) (f y)

{- Explain their similarities and differences.

Because of the type constraint on Pair2, you have to apply the function to both
arguments in the pair. For Pair1, that's not even an option.
-}

    -- Implement a Functor instance for the type ITree, defined as

data ITree a = Leaf (Int -> a) | Node [ITree a]
instance Functor ITree where
  fmap :: (a -> b) -> ITree a -> ITree b
  fmap f (Leaf g)                = Leaf (f . g)
  fmap _ (Node [])               = Node []
  fmap f (Node [x])              = fmap f x
  fmap f (Node nonEmpty@(_:_:_)) = Node $ fmap f <$> nonEmpty

    -- Give an example of a type of kind * -> * which cannot be made an instance of Functor (without using undefined).

-- data Bar a = Bar { a :: Int }
-- instance Functor Bar where
--   fmap :: (a -> b) -> Bar a -> Bar b
--   fmap f (Bar int) = Bar (f int)

    -- Is this statement true or false?

    --     The composition of two Functors is also a Functor.

    -- If false, give a counterexample; if true, prove it by exhibiting some appropriate Haskell code.

-- foo :: [Maybe Int] = [Just 1, Nothing, Just 18]
-- example = map (\x -> fmap (*2) x) foo
