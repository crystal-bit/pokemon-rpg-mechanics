class_name PokemonMoveSet
extends Resource

export(Array) var current_moves = []


func _init():
	for i in range(4):
		var empty_move = PokemonMove.new()
		empty_move.id = -1
		empty_move.name = 'Dummy move %d' % i
		current_moves.push_front(empty_move)


func _to_string():
	var s = ""
	s = '%s, %s, %s, %s' % current_moves
	return s
