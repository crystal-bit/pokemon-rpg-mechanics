extends Control

onready var level = $VBoxContainer/HBoxContainer/Level
onready var pokemon_name = $VBoxContainer/HBoxContainer/Name


func setup(prd: PokemonResourceDynamic):
	var pr: PokemonResource = PokemonLoader.entries[prd.pokemon_resource_id]
	pokemon_name.text = pr.name
	level.text = str(prd.get_level(prd.experience))

