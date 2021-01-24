extends ScrollContainer

onready var vbox = $VBoxContainer
const poke_entry = preload("res://scenes/main/pokemon_entry.tscn")

signal pokemon_hovered()
signal pokemon_selected()


func _ready():
	for poke in PokemonLoader.entries:
		var poke_entry = create_pokemon_entry()
		poke_entry.connect('ready', self, '_setupp', [poke_entry, poke])
		poke_entry.connect('pokemon_entry_pressed', self, '_on_pokemon_entry_pressed')
		poke_entry.connect('pokemon_entry_hovered', self, '_on_pokemon_entry_hovered')
		vbox.add_child(poke_entry)


func _on_pokemon_entry_pressed(entry):
	emit_signal("pokemon_selected", entry.pokemon_resource)


func _on_pokemon_entry_hovered(entry):
	emit_signal("pokemon_hovered", entry.pokemon_resource)


func _setupp(entry, poke_resource):
	entry.setup(poke_resource)


func create_pokemon_entry():
	return poke_entry.instance()

