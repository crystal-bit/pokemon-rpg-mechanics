extends Node

var poke_preview = preload("res://scenes/screens/main/poke-preview.tscn")

var game_save: GameSave

var save_file_path = GameSave.get_save_file_path()
var save_file_dir = GameSave.get_save_dir_path()

onready var current_pokemons = $PanelContainer/VBoxContainer/CurrentPokemons

func print_moves():
	for pokemon in game_save.captured_pokemons:
		var p: PokemonResourceDynamic = pokemon
		print(p.resource_name)
		for m in p.move_set.current_moves:
			print(m.power)

func _init() -> void:
	var f = File.new()
	if f.file_exists(save_file_path):
		print("loading savefile")
		game_save = load_savefile()
		print_moves()
	else:
		print("Creating save file")
		game_save = create_savefile(save_file_dir)


func _ready():
	$VBoxContainer/Button.grab_focus()
	for p in game_save.captured_pokemons:
		p = p as PokemonResourceDynamic
		var p_preview = poke_preview.instance()
		p_preview.setup(p)
		current_pokemons.add_child(p_preview)
		p_preview.connect("mouse_entered", self, "_on_poke_preview_mouse_entered", [p])
	$PanelContainer.set_anchors_and_margins_preset(Control.PRESET_CENTER)
	$PanelContainer.rect_position.y += 70
	$PanelContainer.rect_position.x = get_viewport().get_visible_rect().size.x / 2 - $PanelContainer.get_rect().size.x / 2


func _on_poke_preview_mouse_entered(prd: PokemonResourceDynamic):
	$DebugPopup.update_labels(prd)


func load_savefile() -> GameSave:
	return load(save_file_path) as GameSave


func create_savefile(path: String) -> GameSave:
	var save = GameSave.new()
	var d = Directory.new()
	d.make_dir_recursive(path)
#	var prd = PokemonResourceDynamic.new()
#	# add a defualt pokemon for debug purposes
#	prd.init({
#		"unique_id": 1,
#		"level": 30,
#		"pokemon_resource_id": 0,
#		"effort_values": 10,
#		"experience": 0,
#	})
#	save.captured_pokemons.append(prd)
	var status = ResourceSaver.save(save_file_path, save)
	if status == OK:
		print("GameSave saved")
	else:
		print("Error while saving")
		print(status)
	return save


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/screens/pokemon-creation-screen/pokemon-creation-screen.tscn")


func _on_Button2_pressed():
	var new_scene = load("res://scenes/screens/battle/battle.tscn")
	Global.data['game-save'] = game_save
	get_tree().change_scene_to(new_scene)
