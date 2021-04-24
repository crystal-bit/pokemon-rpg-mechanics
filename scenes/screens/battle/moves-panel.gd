class_name MovesPanel
extends GridContainer

onready var arrows = [
	$Move0/TextureRect,
	$Move1/TextureRect,
	$Move2/TextureRect,
	$Move3/TextureRect
]


onready var selection_pos = Vector2(0, 0)
onready var move_panel_parent = get_parent().get_parent()

signal move_selected(move)


func _ready():
	select_move(selection_pos)
	_on_MovesPanel_visibility_changed()


func setup_pokemon_moves(move_set: PokemonMoveSet):
	var idx = 0
	for move in move_set.current_moves:
		var move_slot: HBoxContainer = get_child(idx)
		move_slot.get_node("Label").text = move.name
		move_slot.set_meta('move_resource', move)
		idx += 1


func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and !event.echo:
			if event.scancode == KEY_S:
				selection_pos.y += 1
			if event.scancode == KEY_W:
				selection_pos.y -= 1
			if event.scancode == KEY_A:
				selection_pos.x -= 1
			if event.scancode == KEY_D:
				selection_pos.x += 1
			selection_pos.x = clamp(selection_pos.x, 0, 1)
			selection_pos.y = clamp(selection_pos.y, 0, 1)
			select_move(selection_pos)
			if event.scancode == KEY_SPACE:
				# TODO: PP not implemented
				var cur_move: PokemonMove = get_current_move()
				if cur_move:
					emit_signal("move_selected", cur_move)


func get_current_move() -> PokemonMove:
	return get_child(get_move_index(selection_pos)).get_meta('move_resource')


func get_move_index(pos: Vector2):
	return (pos.x + 2 * pos.y)


func select_move(pos: Vector2):
	for arrow in arrows:
		arrow = arrow as TextureRect
		arrow.modulate.a = 0

	var selected: HBoxContainer = get_child(get_move_index(pos))
	selected.get_node("TextureRect").modulate.a = 1


func _on_MovesPanel_visibility_changed() -> void:
	set_process_unhandled_input(move_panel_parent.visible)
