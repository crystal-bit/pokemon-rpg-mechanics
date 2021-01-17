class_name PokemonTypes
extends Resource

# Note: some types are included in here only for compatibility
# with moves.csv file (which contains moves from multiple
# generations of Pokemon).
# Some types such as WIND and STEEL were not available in
# Pokemon generation 1.
enum POKEMON_TYPES {
	# 0
	NORMAL,
	FIGHTING,
	WIND, # didn't exist in Gen 1
	POISON,
	GROUND,
	# 5
	ROCK,
	BUG,
	GHOST,
	STEEL, # didn't exist in Gen 1
	FIRE,
	# 10
	WATER,
	GRASS,
	ELECTRIC,
	PSYCHIC,
	ICE,
	# 15
	DRAGON,
	DARK, # didn't exist in Gen 1
	FAIRY
}

static func get_type_by_id(id: int):
	if id < 0 or id > POKEMON_TYPES.size() - 1:
		print("Error: unsupported type id %d" % id)
		return
	return POKEMON_TYPES.keys()[id]

