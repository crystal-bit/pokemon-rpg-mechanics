extends PanelContainer

onready var vbox := $ScrollContainer/VBoxContainer
onready var warning_text := $ScrollContainer/VBoxContainer/Warning
var selected_moves = 0

signal move_selected
signal move_deselected


func _ready():
	for m in PokemonLoader.moves:
		var btn = Button.new()
		btn.connect("pressed", self, '_on_btn_pressed', [btn])
		btn.text = m.name
		btn.set_meta('pokemon_move', m)
		vbox.add_child(btn)

func _on_btn_pressed(btn: Button):
	warning_text.hide()
	if btn.toggle_mode:
		# deselect
		selected_moves -= 1
		emit_signal("move_deselected", btn)
		btn.toggle_mode = !btn.toggle_mode
		btn.pressed = !btn.pressed
	else:
		if selected_moves >= 4:
			warning_text.show()
			return
		# select
		btn.toggle_mode = !btn.toggle_mode
		btn.pressed = !btn.pressed
		selected_moves += 1
		emit_signal("move_selected", btn)


func get_selected_moves() -> PokemonMoveSet:
	var move_set = PokemonMoveSet.new()
	for b in vbox.get_children():
		if not b is Button:
			continue
		if not b.toggle_mode:
			continue
		var m: PokemonMove = b.get_meta('pokemon_move')
		move_set.current_moves.append(m)
	return move_set
