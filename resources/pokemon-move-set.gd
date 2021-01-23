class_name PokemonMoveSet
extends Resource

export(Array) var current_moves = []


func _init():
	pass


func _to_string():
	var s = ""
	s = '%s, %s, %s, %s' % current_moves
	return s
