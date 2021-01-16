class_name BattlePokemon
extends Node2D

# load pokemon original data
# load actual pokemon id and stats
# we have 2 kinds of information:
# 1. static information (never changes)
#    1. eg: base stats
# 2. dynamic information (changes between pokemons)
#    1. eg: effort values https://bulbapedia.bulbagarden.net/wiki/Effort_values


# data loaded from player save file:
var unique_id
var level
var effort_values
export(int, 1, 151) var pokemon_id setget set_pokemon_id

# this variable will be loaded afterwards
export(Resource) var pokemon_resource


func set_pokemon_id(value):
	if value >=1 and value <=151:
		pokemon_id = value
	else:
		print("Invalid pokemon id")


func _ready() -> void:
	if pokemon_resource:
		print("---")
		print(pokemon_resource)
		print(pokemon_resource.hp)
		print(pokemon_resource.name)
	position = Vector2(200, 200)


func _process(delta: float) -> void:
	pass


func set_data(res: PokemonResource):
	pokemon_resource = res
	$Sprite.texture = res.texture
