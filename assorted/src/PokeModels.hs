module PokeModels where

data FirePokemon
  = Charmander | Charmeleon | Charizard deriving (Show)

data WaterPokemon =
  Squirtle | Wartortle | Blastoise deriving (Show)

data GrassPokemon
  = Bulbasoar | Ivysaur | Venusaur deriving (Show)

data FireMove
  = Ember | Flamethrower | Fireblast deriving (Show)

data WaterMove
  = Bubble | Watergun deriving (Show)

data GrassMove =
  Vinewhip deriving (Show)
