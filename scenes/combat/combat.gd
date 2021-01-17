extends Node2D


var pokemon_scene = preload("res://scenes/pokemon/pokemon.tscn")


func init_pokemons(p: PokemonResourceDynamic):
	var new_poke = pokemon_scene.instance() # _init()
	add_child(new_poke) # _ready()
	new_poke.set_pokemon_resource_dynamic(p)
	property_list_changed_notify()
