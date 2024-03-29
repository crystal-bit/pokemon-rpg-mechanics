# Pokemon data which changes over time (=> dynamic).
# EG: when Pokemon win a battle, they obtain exp.
class_name PokemonResourceDynamic
extends Resource

export var pokemon_resource_id: int # used to load the correct PokemonResource
export(Resource) var move_set
export var experience: int # current pokemon experience
export var current_hp = 0
var evs = {
	'hp': 0, # TODO: update this
	'attack': 0,
	'defense': 0,
	'special_attack': 0,
	'special_defense': 0,
	'speed': 0
}

func _init():
	# TODO: update
	evs['attack'] = 23140
	evs['defense'] = 17280
	evs['special_attack'] = 19625
	evs['special_defense'] = 19625
	evs['speed'] = 24795


func init(data):
	pokemon_resource_id = data.pokemon_resource_id
	evs['hp'] = data.hp_ev
	experience = data.experience
	current_hp = get_stat_hp() # FULL HP on creation
	move_set = PokemonMoveSet.new()


# https://bulbapedia.bulbagarden.net/wiki/Experience#Experience_at_each_level
# Note: using Medium Fast (cubic) curve by default
static func get_level(current_exp) -> int:
	var new_exp = current_exp + 1 # adding one to avoid rounding issues
	var l = pow(new_exp, 1.0 / 3.0)
	return floor(l) as int


func _to_string() -> String:
	return "PokemonResourceDynamic - Lv.%s" % [get_level(experience)]


# https://bulbapedia.bulbagarden.net/wiki/Stat#In_Generations_I_and_II
# https://www.dragonflycave.com/mechanics/stats
func get_stat(stat: String) -> int:
	assert(stat in evs.keys())
	var iv = 0 # IV - NOT IMPLEMENTED
	var ev_stat = evs[stat]
	var ev = floor(ceil(sqrt(ev_stat)) / 4)
	var level = get_level(experience)
	var base_stat = PokemonLoader.get_pokemon(pokemon_resource_id)[stat] as int
	var num = ((iv + base_stat) * 2 + ev) * level
	var den = 100
	return int(floor(num / den)) + 5


# HP stat is handled differently from other stats
func get_stat_hp():
	var iv = 0 # IV - NOT IMPLEMENTED
	var ev = floor(ceil(sqrt(evs['hp'])) / 4)
	var hp = PokemonLoader.get_pokemon(pokemon_resource_id).hp as int
	var level = get_level(experience)
	var num = ((iv + hp) * 2 + ev) * level
	var den = 100
	return int(floor(num / den)) + level + 10


func get_pokemon_resource() -> PokemonResource:
	return PokemonLoader.entries[pokemon_resource_id]
