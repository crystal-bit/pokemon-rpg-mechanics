extends Control

onready var level = $VBoxContainer/HBoxContainer/Level
onready var pokemon_name = $VBoxContainer/HBoxContainer/Name
onready var hp_progress_bar = $VBoxContainer/PanelContainer/HBoxContainer/HPProgressBar
onready var tween = $Tween

signal hp_animation_finished

func _ready():
	$"battle-ref".hide()


func setup(prd: PokemonResourceDynamic):
	var pr: PokemonResource = PokemonLoader.entries[prd.pokemon_resource_id]
	pokemon_name.text = pr.name
	level.text = "Lv." + str(prd.get_level(prd.experience))

	var poke_hp = prd.current_hp
	hp_progress_bar.max_value = prd.get_stat_hp()
	hp_progress_bar.value = poke_hp
	$Debug.set_hp_text(hp_progress_bar.value, hp_progress_bar.max_value)


func set_hp(hp: int):
#	hp_progress_bar.value = hp
	tween.interpolate_property(hp_progress_bar, "value", hp_progress_bar.value, hp, 1)
	tween.start()
	yield(tween, "tween_completed")
	emit_signal("hp_animation_finished")
