extends Node2D


var pokemon_scene = preload("res://scenes/pokemon/pokemon.tscn")


func init_pokemons(p: PokemonResourceDynamic, p2: PokemonResourceDynamic):
	var new_poke = pokemon_scene.instance() # _init()
	new_poke.set_pokemon_resource_dynamic(p)
	add_child(new_poke) # _ready()

	var new_poke2 = pokemon_scene.instance() # _init()
	new_poke2.set_pokemon_resource_dynamic(p2)
	new_poke2.position.set(200, 100)
	add_child(new_poke2) # _ready()
