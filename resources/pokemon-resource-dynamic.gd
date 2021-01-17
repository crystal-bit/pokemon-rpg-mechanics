# Pokemon data which changes over time.
# Ideally this data is the one specific to each
# player game.
# EG: when a Pokemon wins a battle, he obtains experience.
#
# This is combined together with PokemonResource in
# order to populate all Pokemon data.
class_name PokemonResourceDynamic
extends Resource

var pokemon_id: int # used to load the correct PokemonResource
var unique_id: int # each captured pokemon will have its own unique id
var experience: int # current pokemon experience
var level: int # current pokemon level
var effort_values: int
# hp_ev ?
# atk_ev ?

func _init(data):
	unique_id = data.unique_id
	level = data.level
	pokemon_id = data.pokemon_id
	effort_values = data.effort_values
	experience = data.experience
