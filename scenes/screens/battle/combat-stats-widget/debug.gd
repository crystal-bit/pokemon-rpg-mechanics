extends Control


func _on_HPProgressBar_value_changed(value):
	pass


func set_hp_text(current_hp, total_hp):
	$CurrentHP.text = 'HP: %d / %d' % [current_hp, total_hp]
