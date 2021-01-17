extends Node2D

var pokemon_scene = preload("res://scenes/pokemon/pokemon.tscn")
onready var game_save = load("res://resources/game-save.gd")

func _ready():
	var save = game_save.new().game_save
	var new_poke = pokemon_scene.instance() # _init()
	var x = save.captured_pokemons[0]
	new_poke.set_data(x)
	add_child(new_poke) # _ready()
	property_list_changed_notify()
