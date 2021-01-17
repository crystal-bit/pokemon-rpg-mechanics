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


func _process(delta: float) -> void:
	pass


func set_data(res: PokemonResourceDynamic):
	pokemon_resource_dynamic = res
	pokemon_resource = PokemonLoader.entries[res.pokemon_id]
	$Sprite.texture = pokemon_resource.texture
	update_labels()


func update_labels():
	var c := $PanelContainer/VBoxContainer
	var header = Label.new()
	header.text = '--- PokemonResource ---'
	c.add_child(header)
	for pobj in pokemon_resource.get_property_list():
		var p = pobj.name
		if not p in ['type', 'name', 'hp', 'id']:
			continue
		var l = Label.new()
		l.text = p + ": " + str(pokemon_resource[p])
		c.add_child(l)

	var _l = Label.new()
	_l.text = '--- PokemonResourceDynamic ---'
	c.add_child(_l)

	for pobj in pokemon_resource_dynamic.get_property_list():
		var p = pobj.name
		if not p in ['experience', 'pokemon_unique_id', 'pokemon_id', 'level', 'effort_values']:
			continue
		var l = Label.new()
		l.text = p + ": " + str(pokemon_resource_dynamic[p])
		c.add_child(l)

