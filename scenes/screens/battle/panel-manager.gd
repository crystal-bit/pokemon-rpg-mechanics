extends CanvasLayer

enum STATES {
	INFO,
	ACTION_SELECT,
	MOVE_SELECT,
}

var state
onready var action_select_panel := $ActionSelectPanel
onready var moves_panel := $MovesPanel
onready var info_panel := $InfoPanel
onready var turn := get_node("../Turn")


func _ready():
	action_select_panel.hide()
	set_state(STATES.ACTION_SELECT)


func set_state(new_state, payload = null):
	state = new_state
	match state:
		STATES.INFO:
			info_panel.show_message(payload)
			action_select_panel.hide()
			moves_panel.hide()
		STATES.ACTION_SELECT:
			info_panel.show_message("")
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
	if turn.is_player() and state == STATES.MOVE_SELECT:
		if event.is_action_pressed("ui_cancel"):
			set_state(STATES.ACTION_SELECT)


func _on_GridContainer_move_selected(move: PokemonMove) -> void:
	print(move.name)
	print("power: %s" % move.power)
	print("pp: %s" % move.pp)


func _on_MovesPanel_move_selected(move) -> void:
	moves_panel.hide()


func _on_Turn_player_turn_started() -> void:
	set_state(STATES.ACTION_SELECT)
