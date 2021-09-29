extends HBoxContainer


func _on_Exp_value_experience_changed(new_exp):
	$HSlider.value = new_exp

func set_exp(val):
	_on_Exp_value_experience_changed(val)
	$HSlider.emit_signal("value_changed", val)

func get_exp():
	return $HSlider.value
