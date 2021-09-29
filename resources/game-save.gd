class_name GameSave
extends Resource

const PRODUCTION_SAVE_FILE_DIR = "user://"
const SAVE_FILE_NAME = "save.tres"

export var game_version: String = "1.0"
export(Array) var captured_pokemons = [] # Array<PokemonResourceDynamic>


func get_captured_pokemon(idx) -> PokemonResourceDynamic:
	if captured_pokemons.size() == 0:
		print("No captured pokemon")
		return null
	elif idx < 0 or idx >= captured_pokemons.size():
		print("Error: index not in range")
		return null
	else:
		return captured_pokemons[idx]


static func get_save_dir_path() -> String:
	return PRODUCTION_SAVE_FILE_DIR


static func get_save_file_path() -> String:
	return PRODUCTION_SAVE_FILE_DIR.plus_file(SAVE_FILE_NAME)

func save():
	return ResourceSaver.save(get_save_file_path(), self)
