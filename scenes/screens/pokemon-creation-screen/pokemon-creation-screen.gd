extends CanvasLayer


onready var panel := $MarginContainer/HBoxContainer/PokemonResourceDynamicPanel
onready var moves_panel := $MarginContainer/HBoxContainer/MovesPanel


func _on_Button_pressed():
	var pokemon_data = panel.get_pokemon_resource_dynamic()
	pokemon_data.move_set = moves_panel.get_selected_moves()
	save_pokemon(pokemon_data)


func save_pokemon(data):
	Global.game_save.captured_pokemons.push_back(data)
	var res = ResourceSaver.save("res://player_data/save.tres", Global.game_save)
	if res != OK:
		print("Error ", res, " while saving resource")
	else:
		yield(get_tree().create_timer(0.3), "timeout")
		get_tree().change_scene("res://scenes/main.tscn")



