module PokemonTypesOnly
  (
  ) where

import PokeModels

pickFireMove :: FirePokemon -> FireMove
pickFireMove Charmander = Ember
pickFireMove Charmeleon = Flamethrower
pickFireMove Charizard  = Fireblast

pickWaterMove :: WaterPokemon -> WaterMove
pickWaterMove Squirtle = Bubble
pickWaterMove _        = Watergun

pickGrassMove :: GrassPokemon -> GrassMove
pickGrassMove x = Vinewhip
