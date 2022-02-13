extends Control

onready var vbox = $VBoxContainer/ScrollContainer/VBoxContainer
const poke_entry = preload("res://scenes/screens/pokemon-creation-screen/pokemon_entry.tscn")

signal pokemon_hovered()
signal pokemon_selected()


func _ready():
	for poke in PokemonLoader.entries:
		var pokemon_entry = create_pokemon_entry(poke)
		vbox.add_child(pokemon_entry)
	vbox.get_children()[0].get_node("Button").grab_focus()


func _on_pokemon_entry_pressed(entry):
	emit_signal("pokemon_selected", entry.pokemon_resource)


func _on_pokemon_entry_hovered(entry):
	emit_signal("pokemon_hovered", entry.pokemon_resource)


func _setup(entry, poke_resource):
	entry.setup(poke_resource)


func create_pokemon_entry(poke: PokemonResource):
	var p = poke_entry.instance()
	p.connect('ready', self, '_setup', [p, poke])
	p.connect('pokemon_entry_pressed', self, '_on_pokemon_entry_pressed')
	p.connect('pokemon_entry_hovered', self, '_on_pokemon_entry_hovered')
	return p

