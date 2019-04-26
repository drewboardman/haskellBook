module Functors () where


    -- Implement Functor instances for Either e and ((->) e).
data Either' a b = Left' a | Right' b deriving (Eq, Show, Ord)
instance Functor (Either' e) where
  fmap func (Right' e) = Right' (func e)
  fmap _ (Left' e) = Left' e

newtype Foo a b = Foo (a -> b)
instance Functor (Foo a) where
  fmap f (Foo g) = Foo (\x -> f $ g x)
    -- Implement Functor instances for ((,) e) and for Pair, defined as

    -- data Pair a = Pair a a

    -- Explain their similarities and differences.
    -- Implement a Functor instance for the type ITree, defined as

    -- data ITree a = Leaf (Int -> a) 
    --              | Node [ITree a]

    -- Give an example of a type of kind * -> * which cannot be made an instance of Functor (without using undefined).
    -- Is this statement true or false?

    --     The composition of two Functors is also a Functor.

    -- If false, give a counterexample; if true, prove it by exhibiting some appropriate Haskell code.

