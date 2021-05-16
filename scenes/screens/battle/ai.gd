extends Node

onready var battlec = get_parent()

signal move_decided

func _ready() -> void:
	randomize()


func opponent_turn():
	var opponent = battlec.get_opponent_pokemon()
	var m = get_random_move(opponent)
	emit_signal("move_decided", m)


func get_random_move(opponent: PokemonResourceDynamic):
	var l = opponent.move_set.current_moves.size()
	return opponent.move_set.current_moves[randi() % l]
