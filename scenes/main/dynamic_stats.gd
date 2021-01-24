extends PanelContainer

var prd

onready var poke_resource_id := $VBoxContainer/PokeResourceId/LineEdit
onready var level := $VBoxContainer/Level/SpinBox
onready var ev := $VBoxContainer/EV/LineEdit
onready var experience := $VBoxContainer/Exp/LineEdit
onready var header := $VBoxContainer/Header


func setup(data: PokemonResourceDynamic):
	header.text = "PokemonResourceDynamic #%d" % data.unique_id
	poke_resource_id.text = str(data.pokemon_resource_id)
	level.value = data.level
	ev.text = str(data.effort_values)
	experience.text = str(data.experience)


func _on_ScrollContainer_pokemon_selected(poke_res) -> void:
	prd = PokemonResourceDynamic.new()
	prd.pokemon_resource_id = poke_res.id
	setup(prd)

