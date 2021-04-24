extends PanelContainer

var prd

onready var poke_resource_id := $VBoxContainer/PokeResourceId/LineEdit
onready var level := $VBoxContainer/Level/LineEdit
onready var ev := $VBoxContainer/EV/LineEdit
onready var experience := $VBoxContainer/Exp/HSlider
onready var header := $VBoxContainer/Header
var unique_id


func setup(data: PokemonResourceDynamic):
	header.text = "PokemonResourceDynamic #%d" % data.unique_id
	unique_id = data.unique_id
	poke_resource_id.text = str(data.pokemon_resource_id)
	ev.text = str(data.hp_ev)
	experience.value = data.experience


func get_pokemon_resource_dynamic():
	var p = PokemonResourceDynamic.new()
	p.init({
		unique_id = unique_id,
		pokemon_resource_id = int(poke_resource_id.text),
		hp_ev = int(ev.text),
		experience = int(experience.value),
#		level = int(level.value),
	})
	return p


func _on_Pokemons_pokemon_selected(poke_res) -> void:
	prd = PokemonResourceDynamic.new()
	prd.pokemon_resource_id = poke_res.id
	setup(prd)
