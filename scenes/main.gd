extends Node

var poke_preview = preload("res://scenes/screens/main/poke-preview.tscn")

onready var current_pokemons = $PanelContainer/VBoxContainer/CurrentPokemons

func _ready():
	$VBoxContainer/Button.grab_focus()
	for p in Global.game_save.captured_pokemons:
		p = p as PokemonResourceDynamic
		var p_preview = poke_preview.instance()
		p_preview.setup(p)
		current_pokemons.add_child(p_preview)
		p_preview.connect("mouse_entered", self, "_on_poke_preview_mouse_entered", [p])
	$PanelContainer.set_anchors_and_margins_preset(Control.PRESET_CENTER)
	$PanelContainer.rect_position.y += 120
	$PanelContainer.rect_position.x = get_viewport().get_visible_rect().size.x / 2 - $PanelContainer.get_rect().size.x / 2


func _on_poke_preview_mouse_entered(prd: PokemonResourceDynamic):
	$DebugPopup.update_labels(prd)


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/screens/pokemon-creation-screen/pokemon-creation-screen.tscn")


func _on_Button2_pressed():
	var new_scene = load("res://scenes/screens/battle/battle.tscn")
	get_tree().change_scene_to(new_scene)


func _on_Button3_pressed() -> void:
	get_tree().quit()


func _on_Button4_pressed() -> void:
	get_tree().change_scene("res://scenes/screens/moves-list/moves-list.tscn")
