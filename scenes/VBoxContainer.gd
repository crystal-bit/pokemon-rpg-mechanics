extends VBoxContainer

signal pokemons_selected

var first_pokemon_selected = false

func _on_ScrollContainer_pokemon_hovered(poke):
	if first_pokemon_selected:
		return
		$PanelContainer2.add_poke_resource_labels(poke)
	else:
		$PanelContainer.add_poke_resource_labels(poke)


func _on_ScrollContainer_pokemon_selected(poke):
	if first_pokemon_selected:
		return
		$PanelContainer2.add_poke_resource_labels(poke)
		emit_signal("pokemons_selected")
	else:
		$PanelContainer.add_poke_resource_labels(poke)
	first_pokemon_selected = true

