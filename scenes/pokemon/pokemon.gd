class_name Pokemon
extends Node2D

# there are 2 kind of stats:
# 1. static information (never changes)
#    1. eg: base stats
# 2. dynamic information (changes between pokemons)
#    1. eg: effort values https://bulbapedia.bulbagarden.net/wiki/Effort_values
#    2. eg: individual values https://bulbapedia.bulbagarden.net/wiki/Individual_values

var pokemon_resource: PokemonResource
var pokemon_resource_dynamic: PokemonResourceDynamic

func _ready() -> void:
	position = Vector2(200, 200)


func set_pokemon_resource_dynamic(res):
	pokemon_resource_dynamic = res
	pokemon_resource = PokemonLoader.entries[res.pokemon_resource_id]
	$Sprite.texture = pokemon_resource.texture
	$PanelContainer.update_labels(pokemon_resource, pokemon_resource_dynamic)
