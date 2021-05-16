extends Node


func _unhandled_input(event):
	if event is InputEventKey:
		if (event.scancode == KEY_ESCAPE or event.scancode == KEY_Q) and event.pressed:
			get_tree().change_scene("res://scenes/main.tscn")
