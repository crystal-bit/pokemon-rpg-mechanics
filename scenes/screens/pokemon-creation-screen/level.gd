extends HBoxContainer



func _on_Exp_value_experience_changed(new_exp):
	var new_level = PokemonResourceDynamic.get_level(new_exp)
	$LineEdit.text = str(new_level)
