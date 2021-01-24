class_name PokemonMoveSet
extends Resource

export(Array) var current_moves = []


func _init():
	pass


func _to_string():
	var s = ""
	for m in current_moves:
		s += "%s " % m
	return s
