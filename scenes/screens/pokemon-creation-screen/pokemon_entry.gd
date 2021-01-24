extends PanelContainer

signal pokemon_entry_pressed()
signal pokemon_entry_hovered()

onready var btn = $Button
onready var l_name := $HBoxContainer/Name
onready var tex_rect := $HBoxContainer/TextureRect

var pokemon_resource


func setup(poke_data: PokemonResource):
	tex_rect.texture = poke_data.texture
	l_name.text = poke_data.name
	pokemon_resource = poke_data


func _ready():
	btn.connect("pressed", self, '_on_btn_pressed')
	btn.connect('mouse_entered', self, '_on_btn_focus_entered')


func _on_btn_focus_entered():
	emit_signal("pokemon_entry_hovered", self)


func _on_btn_pressed():
	emit_signal("pokemon_entry_pressed", self)

