extends Node

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
