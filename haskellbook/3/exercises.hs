module Strings where

import           Data.List.Split

dropper :: String -> String
dropper = tail

checker :: String -> String
checker "Curry is awesome!" = "y"
checker x                   = "Sorry not the right argument."

charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName x   = "Cecil"

thirdBoi :: String -> Char
thirdBoi x = x !! 3

numBoi :: Int -> Char
numBoi num = "Hello World!" !! num

rvrs :: String -> String
rvrs orig = unwords newArr
  where
    split = splitOn " " orig
    newArr = reverse split

main :: IO ()
main = print (rvrs "Curry is awesome")
