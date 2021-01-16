extends Node2D

const TEXTURES_PATH = "res://assets/pokemon-sprites/%s.png"
var entries = []


func _init() -> void:
	entries = _load_pokemon_resources_from_csv(
		"res://data/pokemon-data/gen01.csv"
	)


func _load_pokemon_resources_from_csv(csv_filepath):
	var pokemon_resources = []
	var file = File.new()
	var line_idx= 0
	file.open(csv_filepath, File.READ)
	while !file.eof_reached():
		var line = file.get_csv_line()
		# skip header
		if line_idx == 0:
			line_idx += 1
			continue
		var item_data = PokemonResource.new("")
		item_data.name = line[1]
		item_data.type = line[2]
		item_data.hp = line[5]
		item_data.texture = load(TEXTURES_PATH % line_idx)
		pokemon_resources.append(item_data)
		line_idx += 1
	file.close()
	return pokemon_resources


#func create_pokemons():
#	var node = self
#	var Pokev2 = preload("res://poke-v3/poke-v3.tscn")
#	var i = 0
#	var pokemon_per_row = 10
#	var a_poke
#	for entry in entries:
#		if i > 150:
#			continue
#		var pk = Pokev2.instance()
#		pk.poke_resource = entry
#		node.add_child(pk)
#		pk.name = entry.name
#		pk.owner = self
#		pk.position.x = 64 * (i % pokemon_per_row)
#		pk.position.y = 64 * (floor(i / pokemon_per_row))
#		a_poke = pk
#		i += 1
