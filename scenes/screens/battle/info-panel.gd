extends PanelContainer

onready var label = $MarginContainer/Label


func show_message(msgs):
	label.text = msgs
