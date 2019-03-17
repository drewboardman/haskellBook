module PokeModels where

class Pokemon a
instance Pokemon FirePokemon
instance Pokemon WaterPokemon
instance Pokemon GrassPokemon
instance Pokemon AirPokemon

data FirePokemon
  = Charmander | Charmeleon | Charizard deriving (Show)

data WaterPokemon =
  Squirtle | Wartortle | Blastoise deriving (Show)

data GrassPokemon
  = Bulbasoar | Ivysaur | Venusaur deriving (Show)

data AirPokemon = Foo deriving (Show)

class PokeMove a
instance PokeMove FireMove
instance PokeMove WaterMove
instance PokeMove GrassMove

data FireMove
  = Ember | Flamethrower | Fireblast deriving (Show)

data WaterMove
  = Bubble | Watergun deriving (Show)

data GrassMove =
  Vinewhip deriving (Show)
