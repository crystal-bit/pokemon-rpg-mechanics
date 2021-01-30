extends MarginContainer

var poke_res

func setup(data: PokemonResourceDynamic):
	poke_res = PokemonLoader.get_pokemon(data.pokemon_resource_id)
	$VBoxContainer/Label.text = poke_res.name
	$VBoxContainer/TextureRect.texture = poke_res.texture


func _on_PokePreview_mouse_entered():
	print("enter")


func _on_PokePreview_mouse_exited():
	print("exit")
