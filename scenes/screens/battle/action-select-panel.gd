extends PanelContainer


func _on_ActionSelectPanel_visibility_changed() -> void:
	$MarginContainer/GridContainer.set_process_unhandled_input(visible)
