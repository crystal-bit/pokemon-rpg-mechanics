extends PanelContainer


func setup(data: PokemonResource):
	$VBoxContainer/HP/LineEdit.text = str(data.hp)
	$VBoxContainer/Header.text = "Pokemon Resource #%d" % data.id



func _ready() -> void:
	pass


func _on_ScrollContainer_pokemon_hovered() -> void:
	pass # Replace with function body.


func _on_ScrollContainer_pokemon_selected(data: PokemonResource) -> void:
	setup(data)
