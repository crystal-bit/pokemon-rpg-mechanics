extends Node

func _unhandled_input(event):
	if event is InputEventKey:
		if (event.scancode == KEY_K) and event.pressed:
			get_tree().change_scene("res://scenes/main.tscn")
