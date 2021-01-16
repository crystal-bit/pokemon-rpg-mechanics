class_name PokemonResourceDynamic
extends Resource

var unique_id: int
var level: int
var pokemon_id: int
var effort_values: int
# hp_ev ?
# atk_ev ?

#class PokemonResourceData:
#	unique_id: int

func _init(data):
	print(data)
	unique_id = data.unique_id
	level = data.level
	pokemon_id = data.pokemon_id
	effort_values = data.effort_values

