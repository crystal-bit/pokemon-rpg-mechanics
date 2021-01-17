# https://bulbapedia.bulbagarden.net/wiki/List_of_moves
class_name PokemonMove
extends Resource

export(int) var id
export(PokemonTypes.POKEMON_TYPES) var type
export(String) var name = ""
var type2
var pp
var power
var accuracy
var target_id
var damage_class_id
var effect_id
var effect_chance


func _to_string() -> String:
	return "PokemonMove#%d - %s" % [id, name]
