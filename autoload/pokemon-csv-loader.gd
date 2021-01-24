# Loads all the base game data.
# Needed for other pokemon resources.
extends Node

const TEXTURES_PATH = "res://assets/pokemon-sprites/%s.png"
const POKEDEX_CSV_PATH = "res://data/pokemon-data/gen01.csv"
const MOVES_CSV_PATH = "res://data/pokemon-data/moves.csv"

var entries = []
var moves = []


func _init() -> void:
	entries = _load_pokemon_resources_from_csv(POKEDEX_CSV_PATH)
	moves = _load_moves_from_csv(MOVES_CSV_PATH)


func get_pokemon(poke_id: int) -> PokemonResource:
	return entries[poke_id]


func get_move(move_id: int) -> PokemonMove:
	return moves[move_id]


func get_move_by_name(n) -> PokemonMove:
	for m in moves:
		if m.name == n:
			return m
	print("No move found with name %s" % n)
	return moves[0]


func _load_moves_from_csv(csv_filepath):
	var _moves = []
	var file = File.new()
	var line_idx = 0
	file.open(csv_filepath, File.READ)
	while !file.eof_reached():
		var line = file.get_csv_line()

		# skip header
		if line_idx == 0:
			line_idx += 1
			continue

		var generation_id = int(line[2])
		# load only moves from generation 1
		if generation_id > 1:
			continue

		var el = PokemonMove.new()
		el.id = int(line[0]) - 1
		el.name = line[1]
		var type_id = int(line[2])
		el.type = PokemonTypes.get_type_by_id(type_id)
		el.power = line[3] # nullable
		el.pp = line[4]
		el.accuracy = line[5]
#		el.priority = line[6]
		el.target_id = line[7]
		el.damage_class_id = line[8]
		el.effect_id = line[9]
		el.effect_chance = line[10] # nullable
		_moves.push_back(el)
		line_idx += 1
	file.close()
	return _moves


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
		var item_data = PokemonResource.new()
		item_data.id = int(line[0]) - 1
		item_data.name = line[1]
		item_data.type = line[2]
		item_data.hp = line[5]
		item_data.texture = load(TEXTURES_PATH % line_idx)
		pokemon_resources.append(item_data)
		line_idx += 1
	file.close()
	return pokemon_resources
