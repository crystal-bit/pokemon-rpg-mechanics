extends Node

var save_file_path = GameSave.get_save_file_path()
var save_file_dir = GameSave.get_save_dir_path()

var game_save: GameSave
var data = {

}

func _init() -> void:
	var f = File.new()
	if f.file_exists(save_file_path):
		game_save = load_savefile()
	else:
		game_save = create_savefile(save_file_dir)


func load_savefile() -> GameSave:
	return load(save_file_path) as GameSave


func create_savefile(path: String) -> GameSave:
	var save = GameSave.new()
	var d = Directory.new()
	d.make_dir_recursive(path)
	var status = ResourceSaver.save(save_file_path, save)
	if status == OK:
		print("GameSave saved")
	else:
		print("Error while saving")
		print(status)
	return save
