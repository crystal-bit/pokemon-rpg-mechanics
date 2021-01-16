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
# base static stats
export(int) var hp
# TODO: other stats

func _init(args = "") -> void:
	print(args)


# func _init(poke_id) -> void:
# 	_init_pokemon_data(poke_id)


# func _init_pokemon_data(id):
# 	var p = db.Pokemons.data[id]
# 	self.hp = p.hp
# 	type = p.type
# 	name = p.name
# 	texture = p.texture
