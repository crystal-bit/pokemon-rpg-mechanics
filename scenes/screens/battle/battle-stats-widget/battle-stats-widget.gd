extends Control

onready var level = $VBoxContainer/HBoxContainer/Level
onready var pokemon_name = $VBoxContainer/HBoxContainer/Name
onready var hp_progress_bar = $VBoxContainer/PanelContainer/HBoxContainer/HPProgressBar


func _ready():
	$"battle-ref".hide()


func setup(prd: PokemonResourceDynamic):
	var pr: PokemonResource = PokemonLoader.entries[prd.pokemon_resource_id]
	pokemon_name.text = pr.name
	level.text = "Lv." + str(prd.get_level(prd.experience))

	var poke_hp = prd.get_hp()
	# TODO: current pokemon HP (eg: if the pokemon has battled and does not
	# have full hps)
#	print(pokemon_name.text, " ", poke_hp)
	hp_progress_bar.max_value = poke_hp
	hp_progress_bar.value = poke_hp
	$Debug.set_hp_text(poke_hp, poke_hp)

