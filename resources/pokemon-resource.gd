# Common static data for each Pokemon.
# All the properties remain the same for different
# `Pokemon` instances with the same.
class_name PokemonResource
extends Resource

# The pokedex number for the Pokemon
export(int, 1, 151) var id setget set_pokemon_id
export(Texture) var texture
export(PokemonTypes.POKEMON_TYPES) var type
export(PokemonTypes.POKEMON_TYPES) var type2
export(String) var name
export(int) var hp
export(int) var attack
export(int) var defense
export(int) var special_attack
export(int) var special_defense
export(int) var speed

func set_pokemon_id(value: int):
	if value >=0 and value <=150:
		id = value
	else:
		print("Invalid pokemon id %d" % value)

func _to_string() -> String:
	return "PokemonResource#%d - %s" % [id, name]
