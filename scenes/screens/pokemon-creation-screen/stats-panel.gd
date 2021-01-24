extends PanelContainer

var poke_resource

func setup(data: PokemonResource):
	$VBoxContainer/HP/LineEdit.text = str(data.hp)
	$VBoxContainer/Header.text = "Pokemon Resource #%d" % data.id


func _on_Pokemons_pokemon_selected(data: PokemonResource):
	poke_resource = data
	setup(data)
