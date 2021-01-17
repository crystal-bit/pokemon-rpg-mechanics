extends Node2D


var pokemon_scene = preload("res://scenes/pokemon/pokemon.tscn")


func _ready():
	pass

func init_pokemons():
	var save = get_parent().game_save
	var p = save.captured_pokemons[0]
	var new_poke = pokemon_scene.instance() # _init()

	print(p)
	return
	new_poke.set_pokemon_resource_dynamic(p)
	add_child(new_poke) # _ready()
	property_list_changed_notify()
