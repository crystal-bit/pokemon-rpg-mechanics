extends Node

enum TURN {
	PLAYER,
	OPPONENT
}

signal player_turn_started

var turn = TURN.PLAYER

func is_player():
	return turn == TURN.PLAYER


func is_opponent():
	return turn == TURN.OPPONENT


func next():
	if turn == TURN.PLAYER:
		turn = TURN.OPPONENT
	else:
		emit_signal("player_turn_started")
		turn = TURN.PLAYER

