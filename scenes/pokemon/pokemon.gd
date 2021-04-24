class_name Pokemon
extends Node2D

var pokemon_resource: PokemonResource
var pokemon_resource_dynamic: PokemonResourceDynamic

onready var panel = $PanelContainer
onready var sprite = $Sprite

func _ready() -> void:
	position = Vector2(200, 200)


func set_pokemon_resource_dynamic(res):
	pokemon_resource_dynamic = res
	pokemon_resource = PokemonLoader.entries[res.pokemon_resource_id]
	sprite.texture = pokemon_resource.texture
	panel.update_labels(pokemon_resource, pokemon_resource_dynamic)
	yield(get_tree(), "idle_frame")
	panel.rect_position.y = -panel.get_rect().size.y / 2


func attack(target: Pokemon):
	target.pokemon_resource.hp
	pass

