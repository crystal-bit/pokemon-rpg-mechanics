# https://bulbapedia.bulbagarden.net/wiki/List_of_moves
class_name PokemonMove
extends Resource

export(int) var id = 0
export(PokemonTypes.POKEMON_TYPES) var type = PokemonTypes.POKEMON_TYPES.NORMAL
export(String) var name = ""

export(int) var pp = null
export(int) var power: int = 0
export(int) var accuracy: int = 0
export(int) var target_id = 0
export(int) var damage_class_id = 0
export(int) var effect_id = 0
export(int) var effect_chance = 0

func _to_string() -> String:
	return "%s" % [name]
