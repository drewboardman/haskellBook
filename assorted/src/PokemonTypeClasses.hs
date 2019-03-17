{-# LANGUAGE MultiParamTypeClasses #-}

module PokemonTypeClasses () where

import           PokeModels

-- we are going to create a Pokemon Type Class
-- it is a subclass of the Show Type Class
-- this means that `a` has an instance of Show
-- and that `b` has an instance of Show

class (Show a, Show b) => Pokemon a b where
  pickMove :: a -> b

-- here we're going to define an instance of Pokemon for Fire pokemon and moves
-- we have to implement the pickMove function
instance Pokemon FirePokemon FireMove where
  pickMove Charmander = Ember
  pickMove Charmeleon = Flamethrower
  pickMove Charizard  = Fireblast

instance Pokemon WaterPokemon WaterMove where
  pickMove Squirtle = Bubble
  pickMove _        = Watergun

instance Pokemon GrassPokemon GrassMove where
  pickMove _ = Vinewhip

class (Pokemon a b, Pokemon c d) => Battle a b c d where
  battle :: a -> b -> IO ()

printBattle :: String -> String -> String -> String -> String -> IO ()
printBattle pokemonOne moveOne pokemonTwo moveTwo winner = do
  putStrLn $ pokemonOne ++ " used " ++ moveOne
  putStrLn $ pokemonTwo ++ " used " ++ moveTwo
  putStrLn $ "Winner is: " ++ winner ++ "\n"
