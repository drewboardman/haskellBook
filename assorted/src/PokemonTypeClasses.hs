{-# LANGUAGE MultiParamTypeClasses #-}

module PokemonTypeClasses (main) where

import Data.Tuple (swap)

data Fire = Charmander | Charmeleon | Charizard deriving Show
data Water = Squirtle | Wartortle | Blastoise deriving Show
data Grass = Bulbasaur | Ivysaur | Venusaur deriving Show

data FireMove = Ember | FlameThrower | FireBlast deriving Show
data WaterMove = Bubble | WaterGun deriving Show
data GrassMove = VineWhip deriving Show

class (Show pokemon, Show move) => Pokemon pokemon move where
  pickMove :: pokemon -> move

instance Pokemon Fire FireMove where
  pickMove Charmander = Ember
  pickMove Charmeleon = FlameThrower
  pickMove Charizard = FireBlast

instance Pokemon Water WaterMove where
  pickMove Squirtle = Bubble
  pickMove _ = WaterGun

instance Pokemon Grass GrassMove where
  pickMove _ = VineWhip

printBattle :: String -> String -> String -> String -> String -> IO ()
printBattle pokemonOne moveOne pokemonTwo moveTwo winner = do
  putStrLn $ pokemonOne ++ " used " ++ moveOne
  putStrLn $ pokemonTwo ++ " used " ++ moveTwo
  putStrLn $ "Winner is: " ++ winner ++ "\n"

-- show Our Battle Type Class, yuck
class (Pokemon pokemon move, Pokemon foe foeMove)
  => Battle pokemon move foe foeMove where
  battle :: pokemon -> foe -> IO (move, foeMove)
  battle pokemon foe = do
    printBattle (show pokemon) (show move) (show foe) (show foeMove) (show pokemon)
    return (move, foeMove)
   where
    foeMove = pickMove foe
    move = pickMove pokemon

instance Battle Water WaterMove Fire FireMove
instance Battle Fire FireMove Water WaterMove where
  battle a b = swap <$> battle b a

instance Battle Grass GrassMove Water WaterMove
instance Battle Water WaterMove Grass GrassMove where
  battle a b = swap <$> battle b a

instance Battle Fire FireMove Grass GrassMove
instance Battle Grass GrassMove Fire FireMove where
  battle a b = swap <$> battle b a

main :: IO ()
main = do
  _ <- battle Squirtle Charmander :: IO (WaterMove, FireMove)
  _ <- battle Charmeleon Wartortle :: IO (FireMove, WaterMove)
  _ <- battle Bulbasaur Blastoise :: IO (GrassMove, WaterMove)
  _ <- battle Wartortle Ivysaur :: IO (WaterMove, GrassMove)
  _ <- battle Charmeleon Ivysaur :: IO (FireMove, GrassMove)
  _ <- battle Venusaur Charizard :: IO (GrassMove, FireMove)
  putStrLn "Done Fighting"
-- show /
