extends GridContainer

onready var arrows = [
	$Fight/TextureRect,
	$Bag/TextureRect,
	$Pokemon/TextureRect,
	$Run/TextureRect
]


var selected_action_id = 0

signal action_selected(action_string)


func _ready():
	select_action_id(selected_action_id)


func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and !event.echo:
			if event.scancode == KEY_S:
#				if selected_action_id > 1:
#					return
				selected_action_id = clamp(selected_action_id + 2, 0, 3)
			if event.scancode == KEY_W:
				selected_action_id = clamp(selected_action_id - 2, 0, 3)
			if event.scancode == KEY_A:
				selected_action_id = clamp(selected_action_id - 1, 0, 3)
			if event.scancode == KEY_D:
				selected_action_id = clamp(selected_action_id + 1, 0, 3)
			if event.scancode == KEY_SPACE:
				emit_signal("action_selected", get_current_action())
			select_action_id(selected_action_id)


func get_current_action():
	return get_child(selected_action_id).name


func select_action_id(id: int):
	for arrow in arrows:
		arrow = arrow as TextureRect
		arrow.modulate.a = 0
	var selected: HBoxContainer = get_child(id)
	selected.get_node("TextureRect").modulate.a = 1
