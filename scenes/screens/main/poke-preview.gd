extends MarginContainer


func setup(data: PokemonResourceDynamic):
	var poke_res = PokemonLoader.get_pokemon(data.pokemon_resource_id)
	$VBoxContainer/Label.text = poke_res.name
	$VBoxContainer/TextureRect.texture = poke_res.texture
