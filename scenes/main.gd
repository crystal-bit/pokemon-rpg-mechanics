extends Node

var poke_preview := preload("res://scenes/screens/main/poke-preview.tscn")

onready var current_pokemons = $PanelContainer/VBoxContainer/CurrentPokemons

func _ready():
	$VBoxContainer/Button.grab_focus()
	for p in Global.game_save.captured_pokemons:
		p = p as PokemonResourceDynamic
		var p_preview = poke_preview.instance()
		p_preview.setup(p)
		p_preview.connect("delete_pressed", self, "on_delete_pressed")
		current_pokemons.add_child(p_preview)
#		p_preview.connect("mouse_entered", self, "_on_poke_preview_mouse_entered", [p])
	$PanelContainer.set_anchors_and_margins_preset(Control.PRESET_CENTER)
	$PanelContainer.rect_position.y += 120
	$PanelContainer.rect_position.x = get_viewport().get_visible_rect().size.x / 2 - $PanelContainer.get_rect().size.x / 2


func on_delete_pressed(poke: PokemonResourceDynamic):
	Global.game_save.captured_pokemons.erase(poke)
	Global.game_save.save()
	for node in current_pokemons.get_children():
		if node.poke_res_d == poke:
			current_pokemons.remove_child(node)


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/screens/pokemon-creation-screen/pokemon-creation-screen.tscn")


func _on_Button2_pressed():
	if len(Global.game_save.captured_pokemons) < 2:
		OS.alert('You need to create at least 2 pokemons to start a battle')
	else:
		var new_scene = load("res://scenes/screens/battle/battle.tscn")
		get_tree().change_scene_to(new_scene)


func _on_Button3_pressed():
	get_tree().quit()


func _on_Button4_pressed() -> void:
	get_tree().change_scene("res://scenes/screens/moves-list/moves-list.tscn")
