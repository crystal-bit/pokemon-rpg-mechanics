extends Node2D
class_name Battle

var opponent_poke: PokemonResourceDynamic
var player_poke: PokemonResourceDynamic

onready var moves_panel: MovesGrid = $PanelManager/MovesPanel/MarginContainer/MovesGrid

func _ready():
	var game_save = Global.game_save
	player_poke = game_save.captured_pokemons[0]
	opponent_poke = game_save.captured_pokemons[1]
	setup(player_poke, opponent_poke)
	$CombatWidgets/PlayerWidget.setup(player_poke)
	$CombatWidgets/OpponentWidget.setup(opponent_poke)


func setup(player: PokemonResourceDynamic, opponent: PokemonResourceDynamic):
	var player_poke_res: PokemonResource = PokemonLoader.entries[player.pokemon_resource_id]
	var opponent_poke_res: PokemonResource = PokemonLoader.entries[opponent.pokemon_resource_id]
	$Player.texture = player_poke_res.back_texture
	$Opponent.texture = opponent_poke_res.texture
	# setup moves
	moves_panel.setup_pokemon_moves(player.move_set)
