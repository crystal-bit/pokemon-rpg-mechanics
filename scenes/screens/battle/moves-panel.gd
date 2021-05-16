extends PanelContainer
class_name MovesPanel

signal move_selected

func _on_MovesGrid_move_selected(move) -> void:
	emit_signal("move_selected", move)
