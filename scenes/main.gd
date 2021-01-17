extends Node2D

var game_save


func _init() -> void:
	var f = File.new()
	var save_file_path = GameSave.get_save_file_path()
	if f.file_exists(save_file_path):
		print("loading savefile")
		game_save = load(save_file_path)
	else:
		print("creating savefile")
		create_initial_save_file(GameSave.get_save_dir_path())


func _ready() -> void:
	$Combat.init_pokemons(game_save.get_captured_pokemon(0))


func create_initial_save_file(path: String):
	var d = Directory.new()
	d.make_dir_recursive(path)
	game_save = GameSave.new()
	var prd = PokemonResourceDynamic.new()
	# add a defualt pokemon for debug purposes
	prd.init({
		"unique_id": 1,
		"level": 30,
		"pokemon_resource_id": 0,
		"effort_values": 10,
		"experience": 0,
	})
	game_save.captured_pokemons.append(prd)
	var status = ResourceSaver.save(GameSave.get_save_file_path(), game_save)
#	var status = ResourceSaver.save(GameSave.get_save_file_path(), game_save, ResourceSaver.FLAG_BUNDLE_RESOURCES)
	if status == OK:
		print("GameSave saved")
	else:
		print("Error while saving")
		print(status)
