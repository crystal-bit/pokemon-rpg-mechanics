# Pokemon data which changes over time (=> dynamic).
# EG: when Pokemon win a battle, they obtain exp.
class_name PokemonResourceDynamic
extends Resource

export var pokemon_resource_id: int # used to load the correct PokemonResource
export var unique_id: int # each captured pokemon will have its own unique id
export var experience: int # current pokemon experience
export var effort_values: int
# hp_ev ?#
# atk_ev ?
export(Resource) var move_set


func init(data):
	unique_id = data.unique_id
	pokemon_resource_id = data.pokemon_resource_id
	effort_values = data.effort_values
	experience = data.experience
	# move_set = create_default_moveset()


# https://bulbapedia.bulbagarden.net/wiki/Experience#Experience_at_each_level
# Note: using Medium Fast (cubic) curve by default
static func get_level(current_exp) -> int:
	var new_exp = current_exp + 1 # adding one to avoid rounding issues
	var l = pow(new_exp, 1.0 / 3.0)
	return floor(l) as int


static func create_default_moveset():
	var mset := PokemonMoveSet.new()
	mset.current_moves.push_back(PokemonLoader.get_move_by_name('tackle'))
	mset.current_moves.push_back(PokemonLoader.get_move_by_name('roar'))
	return mset


func _to_string() -> String:
	return "PokemonResourceDynamic - Lv.%s" % [get_level(experience)]
