extends Node2D

var game_save

var save_file_path = GameSave.get_save_file_path()
var save_file_dir = GameSave.get_save_dir_path()


func _init() -> void:
	var f = File.new()
	if f.file_exists(save_file_path):
		print("loading savefile")
		game_save = load_savefile()
	else:
		print("Creating save file")
		game_save = create_savefile(save_file_dir)


func load_savefile() -> GameSave:
	return load(save_file_path) as GameSave


func create_savefile(path: String) -> GameSave:
	var save = GameSave.new()
	var d = Directory.new()
	d.make_dir_recursive(path)
	var prd = PokemonResourceDynamic.new()
	# add a defualt pokemon for debug purposes
	prd.init({
		"unique_id": 1,
		"level": 30,
		"pokemon_resource_id": 0,
		"effort_values": 10,
		"experience": 0,
	})
	save.captured_pokemons.append(prd)
	var status = ResourceSaver.save(save_file_path, save)
	if status == OK:
		print("GameSave saved")
	else:
		print("Error while saving")
		print(status)
	return save
