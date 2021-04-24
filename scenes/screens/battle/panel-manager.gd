extends CanvasLayer

enum STATES {
	INFO,
	ACTION_SELECT,
	MOVE_SELECT,
}

var state
onready var action_select_panel := $ActionSelectPanel
onready var moves_panel := $MovesPanel


func _ready():
	action_select_panel.hide()
	set_state(STATES.ACTION_SELECT)


func set_state(new_state):
	state = new_state

	match state:
		STATES.INFO:
			pass
		STATES.ACTION_SELECT:
			action_select_panel.show()
			moves_panel.hide()
		STATES.MOVE_SELECT:
			action_select_panel.hide()
			moves_panel.show()
		_:
			print("Error: state not supported")


func _on_GridContainer_action_selected(action_string):
	match action_string:
		"Fight":
			set_state(STATES.MOVE_SELECT)
		"Run":
			get_tree().change_scene("res://scenes/main.tscn")
		"Pokemon":
			pass


func _unhandled_key_input(event: InputEventKey) -> void:
	if state == STATES.MOVE_SELECT:
		if event.scancode == KEY_ESCAPE:
			set_state(STATES.ACTION_SELECT)



func _on_GridContainer_move_selected(move: PokemonMove) -> void:
	print(move.name)
	print("power: %s" % move.power)
	print("pp: %s" % move.pp)
