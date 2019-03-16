module PokemonViaTypes
  (
  ) where

data FirePokemon
  = Charmander | Charmeleon | Charizard deriving (Show)

data WaterPokemon
  = Squirtle | Wartortle | Blastoise deriving (Show)

data GrassPokemon
  = Bulbasoar | Ivysaur | Venusaur deriving (Show)

data FireMove
  = Ember | Flamethrower | Fireblast deriving (Show)

data WaterMove
  = Bubble | Watergun deriving (Show)

data GrassMove =
  Vinewhip deriving (Show)

pickFireMove :: FirePokemon -> FireMove
pickFireMove Charmander = Ember
pickFireMove Charmeleon = Flamethrower
pickFireMove Charizard  = Fireblast

pickWaterMove :: WaterPokemon -> WaterMove
pickWaterMove Squirtle = Bubble
pickWaterMove _        = Watergun

pickGrassMove :: GrassPokemon -> GrassMove
pickGrassMove x = Vinewhip
