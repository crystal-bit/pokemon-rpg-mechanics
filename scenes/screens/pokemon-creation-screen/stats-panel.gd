extends PanelContainer

var poke_resource


func setup(data: PokemonResource):
	$VBoxContainer/Type/LineEdit.text = str(data.type)
	$VBoxContainer/Type2/LineEdit.text = str(data.type2)
	$VBoxContainer/HP/LineEdit.text = str(data.hp)
	$VBoxContainer/Attack/LineEdit.text = str(data.attack)
	$VBoxContainer/Defense/LineEdit.text = str(data.defense)
	$"VBoxContainer/Special Attack/LineEdit".text = str(data.special_attack)
	$"VBoxContainer/Special Defense/LineEdit".text = str(data.special_defense)
	$VBoxContainer/Speed/LineEdit.text = str(data.speed)
	$VBoxContainer/Header.text = "Pokemon Resource #%d" % data.id


func _on_Pokemons_pokemon_selected(data: PokemonResource):
	poke_resource = data
	setup(data)
