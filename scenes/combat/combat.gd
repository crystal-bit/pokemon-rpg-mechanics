extends Node2D

var pokemon_scene = preload("res://scenes/pokemon/pokemon.tscn")
onready var _save = load("res://resources/game-save.gd")


func _ready():
	var save = _save.new().game_save
	var new_poke = pokemon_scene.instance() # _init()
	new_poke.pokemon_resource = load("res://asdasd.tres")
	_load_poke_data(new_poke, save.captured_pokemon[0])
	add_child(new_poke) # _ready()
	property_list_changed_notify()


func _load_poke_data(poke: BattlePokemon, poke_data: PokemonResourceDynamic):
	poke.pokemon_id = poke_data.pokemon_id
	var poke_resource: PokemonResource = PokemonLoader.entries[poke.pokemon_id]
	poke.set_data(poke_resource)
