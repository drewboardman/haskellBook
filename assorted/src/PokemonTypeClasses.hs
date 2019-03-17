{-# LANGUAGE MultiParamTypeClasses #-}

module PokemonTypeClasses () where

import           PokeModels

-- we are going to create a MovePicker Type Class
-- it is a subclass of the Show Type Class
-- this means that `a` has an instance of Show
-- and that `b` has an instance of Show

class (Pokemon a, PokeMove b) => MovePicker a b where
  pickMove :: a -> b

-- here we're going to define an instance of MovePicker for Fire pokemon and moves
-- we have to implement the pickMove function
instance MovePicker FirePokemon FireMove where
  pickMove Charmander = Ember
  pickMove Charmeleon = Flamethrower
  pickMove Charizard  = Fireblast

instance MovePicker WaterPokemon WaterMove where
  pickMove Squirtle = Bubble
  pickMove _        = Watergun

instance MovePicker GrassPokemon GrassMove where
  pickMove _ = Vinewhip

-- class (MovePicker a b, MovePicker c d) => Battle a b c d where
--   battle :: a -> c -> IO ()

thing :: (MovePicker a c, MovePicker b d) => a -> b -> (String, String)
thing a b = (aString, bString) where
  aString = show $ (pickMove a :: c)
  bString = show $ (pickMove b :: d)

-- printBattle :: (MovePicker a c, MovePicker b d) => a -> b -> IO ()
-- printBattle a b = do
--   let aMove = pickMove a
--   let bMove = pickMove b
--   putStrLn $ (show a) ++ " used " ++ (show aMove)
--   putStrLn $ (show b) ++ " used " ++ (show bMove)
