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
	move_set = create_default_moveset()


static func create_default_moveset():
	var mset := PokemonMoveSet.new()
	mset.current_moves.push_back(PokemonLoader.get_move_by_name('tackle'))
	mset.current_moves.push_back(PokemonLoader.get_move_by_name('roar'))
	return mset


func _to_string() -> String:
	return "PokemonResourceDynamic - Lv.%s" % [level]
