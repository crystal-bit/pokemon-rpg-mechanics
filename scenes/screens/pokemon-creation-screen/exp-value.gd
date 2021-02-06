extends HBoxContainer


signal experience_changed


func _on_HSlider_value_changed(value):
	$LineEdit.text = str(value)
	set_exp(str(value))


func _on_LineEdit_text_entered(new_text):
	set_exp(new_text)


func set_exp(experience: String):
	$LineEdit.text = str(clamp(int(experience), 0, 1000000))
	emit_signal("experience_changed", int($LineEdit.text))
