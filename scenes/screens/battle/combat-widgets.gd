extends CanvasLayer

onready var opponent_widget := $OpponentWidget
onready var player_widget := $PlayerWidget


func set_opponent_hp(new_hp) -> void:
	opponent_widget.set_hp(new_hp)
	yield(opponent_widget, "hp_animation_finished")


func set_player_hp(new_hp) -> void:
	player_widget.set_hp(new_hp)
	yield(player_widget, "hp_animation_finished")
