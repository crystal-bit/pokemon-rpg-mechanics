extends Button

func _on_MovesPanel_move_selected(_btn):
	update_state(get_node("../MovesPanel").selected_moves)

func _on_MovesPanel_move_deselected(_btn):
	update_state(get_node("../MovesPanel").selected_moves)

func update_state(selected_moves):
	disabled = (selected_moves == 0)
