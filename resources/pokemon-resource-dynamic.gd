# Pokemon data which changes over time (=> dynamic).
# EG: when Pokemon win a battle, they obtain exp.
class_name PokemonResourceDynamic
extends Resource

export var pokemon_resource_id: int # used to load the correct PokemonResource
export var unique_id: int # each captured pokemon will have its own unique id
export var experience: int # current pokemon experience
export var level: int # current pokemon level
export var effort_values: int
# hp_ev ?
# atk_ev ?
export(Resource) var move_set


func init(data):
	unique_id = data.unique_id
	level = data.level
	pokemon_resource_id = data.pokemon_resource_id
	effort_values = data.effort_values
	experience = data.experience
	resource_name = _get_resource_name()
	move_set = PokemonMoveSet.new()


func _get_resource_name():
	return "PokemonResourceDynamic#%d - Lv.%s" % [unique_id, level]


func _to_string() -> String:
	return resource_name
