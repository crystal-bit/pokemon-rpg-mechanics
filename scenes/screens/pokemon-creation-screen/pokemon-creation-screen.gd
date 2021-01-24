extends CanvasLayer


onready var prd_panel := $MarginContainer/HBoxContainer/PokemonResourceDynamicPanel
onready var moves_panel := $MarginContainer/HBoxContainer/MovesPanel


func _on_Button_pressed():
	var save: GameSave = load(GameSave.get_save_file_path())

	var poke_dyn_res: PokemonResourceDynamic = prd_panel.get_pokemon_resource_dynamic()
	poke_dyn_res.move_set = PokemonMoveSet.new()
	poke_dyn_res.move_set.current_moves = moves_panel.get_selected_moves()

#	poke_dyn_res.unique_id = prd_panel.prd.unique_id
	if poke_dyn_res:
		save.captured_pokemons.push_back(poke_dyn_res)
		ResourceSaver.save(GameSave.get_save_file_path(), save)
