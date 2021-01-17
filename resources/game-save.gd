class_name GameSave
extends Resource

var DEBUG = OS.is_debug_build()
var SAVE_FILE_DIR = "res://player_data/" if DEBUG else "user://player_data/"
var SAVE_FILE_NAME = "save.tres"

export var game_version: String = "1.0"
# Array<PokemonResourceDynamic>
export(Array) var captured_pokemons = [
	PokemonResourceDynamic.new({
		"unique_id": 1,
		"level": 30,
		"pokemon_resource_id": 0,
		"effort_values": 10,
		"experience": 0,
	})
]

export(Dictionary) var test = {
	"a" : 1,
	"b": 2,
}

func _init() -> void:
	print("game save init")
	var f = File.new()
	var save_file = get_save_file_path()
	if f.file_exists(save_file):
		load_data_from(save_file)
	else:
		create_initial_save_file(SAVE_FILE_DIR, SAVE_FILE_NAME)


func get_save_file_path() -> String:
	return SAVE_FILE_DIR.plus_file(SAVE_FILE_NAME)


func load_data_from(_path):
	print("TODO")


func create_initial_save_file(path: String, file_name: String):
	var d = Directory.new()
	d.make_dir_recursive(path)

	var status = ResourceSaver.save(path.plus_file(file_name), self, ResourceSaver.FLAG_BUNDLE_RESOURCES)
	if status == OK:
		print("GameSave saved")
	else:
		print("Error while saving")
		print(status)
	print(self.captured_pokemons)



