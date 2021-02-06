extends HBoxContainer


func _on_Exp_value_experience_changed(new_exp):
	$HSlider.value = new_exp
