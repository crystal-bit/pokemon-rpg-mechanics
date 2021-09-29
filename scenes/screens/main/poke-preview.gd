extends MarginContainer

var poke_res
var poke_res_d

signal delete_pressed

onready var delete_button := $Control/DeleteButton

func _ready():
	delete_button.hide()

func setup(data: PokemonResourceDynamic):
	poke_res_d = data
	poke_res = PokemonLoader.get_pokemon(data.pokemon_resource_id)
	$VBoxContainer/Label.text = poke_res.name
	$VBoxContainer/TextureRect.texture = poke_res.texture

func _on_PokePreview_mouse_entered():
	delete_button.show()

func _on_PokePreview_mouse_exited():
	delete_button.hide()

func _on_DeleteButton_pressed():
	emit_signal("delete_pressed", poke_res_d)
