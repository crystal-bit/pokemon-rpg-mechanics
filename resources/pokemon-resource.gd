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

export(Texture) var texture
export(POKEMON_TYPES) var type
export(String) var name
export(int) var hp
export(int) var id setget set_pokemon_id
# TODO: other stats

func _init(args = "") -> void:
	pass

func set_pokemon_id(value):
	if value >=0 and value <=150:
		id = value
	else:
		print("Invalid pokemon id")
