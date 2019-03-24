{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies     #-}

module PokemonTypeFamilies (mainFamilies) where

class (Show pokeType, Show (Move pokeType)) => Pokemon pokeType where
  data Move pokeType :: * -- what is this *?
  pickMove :: pokeType -> Move pokeType

data Fire = Charmander | Charmeleon | Charizard deriving Show
data Water = Squirtle | Wartortle | Blastoise deriving Show
data Grass = Bulbasaur | Ivysaur | Venusaur deriving Show

instance Pokemon Fire where
  data Move Fire = Ember | Flamethrower | Fireblast deriving Show
  pickMove Charmander = Ember
  pickMove Charmeleon = Flamethrower
  pickMove Charizard = Fireblast

instance Pokemon Water where
  data Move Water = Bubble | Watergun deriving Show
  pickMove Squirtle = Bubble
  pickMove Wartortle = Bubble
  pickMove Blastoise = Watergun

instance Pokemon Grass where
  data Move Grass = Vinewhip deriving Show
  pickMove Bulbasaur = Vinewhip
  pickMove Ivysaur = Vinewhip
  pickMove Venusaur = Vinewhip

printBattle :: String -> String -> String -> String -> String -> IO ()
printBattle pokemonOne moveOne pokemonTwo moveTwo battleWinner = do
  putStrLn $ pokemonOne ++ " used " ++ moveOne
  putStrLn $ pokemonTwo ++ " used " ++ moveTwo
  putStrLn $ "Winner is: " ++ battleWinner ++ "\n"

class (Show (Winner type1 type2), Pokemon type1, Pokemon type2) => Battle type1 type2 where
  type Winner type1 type2 :: * -- what is this?
  type Winner type1 type2 = type1 -- default to type1 being winner

  pickWinner :: type1 -> type2 -> (Winner type1 type2)

  battle :: type1 -> type2 -> IO ()
  battle type1 type2 = do
    let type1Move = pickMove type1
    let type2Move = pickMove type2
    let winner = pickWinner type1 type2
    printBattle (show type1) (show type1Move) (show type2) (show type2Move) (show winner)

instance Battle Water Fire where
  pickWinner water _  = water

instance Battle Fire Water where
  type Winner Fire Water = Water
  pickWinner = flip pickWinner

mainFamilies :: IO ()
mainFamilies = do
  battle Squirtle Charmander
  battle Charmeleon Wartortle
