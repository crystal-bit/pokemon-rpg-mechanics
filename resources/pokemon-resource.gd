# Common static data for each Pokemon.
# All the properties remain the same for different
# `Pokemon` instances with the same.
class_name PokemonResource
extends Resource

enum POKEMON_TYPES {
	GRASS,
	FIRE,
	ROCK,
	SAND,
	WATER,
	BUG,
	NORMAL,
	ELECTRIC,
	POISON,
	GROUND,
	PSYCHIC,
	ROCK,
	FIGHTING,
	ICE,
	DRAGON,
	FAIRY,
	GHOST
}

# The pokedex number for the Pokemon
export(int, 1, 151) var id setget set_pokemon_id
export(Texture) var texture
export(POKEMON_TYPES) var type
export(String) var name
export(int) var hp
# TODO: other stats


func _init(_args = "") -> void:
	pass


func set_pokemon_id(value: int):
	if value >=1 and value <=151:
		id = value
	else:
		print("Invalid pokemon id %d" % value)

func _to_string() -> String:
	return "PokemonResource#%d - %s" % [id, name]
