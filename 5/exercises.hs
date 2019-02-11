{-# LANGUAGE NoMonomorphismRestriction #-}

module Fiver where

addStuff :: Integer -> Integer -> Integer
addStuff a b = a + b + 5

f :: a -> a -> a -> a
f = undefined

x :: Char
x = undefined

g :: a -> b -> c -> b
g = undefined

h :: (Num a, Num b) => a -> b -> b
h = undefined

jackal :: (Ord a, Eq b) => a -> b -> a
jackal = undefined

kessel :: (Ord a, Num b) => a -> b -> a
kessel = undefined

a = (*9)6
b = head [(0,"test"),(1,"tester")]
c = head[(0 :: Integer, "doge"),(1,"cat")]
d = if False then True else False
e = length [1,2,3,4,5]
m = (length [1,2,3,4,5])>(length "test")

big = (^) 5 $ 10
wahoo = big $ 10
