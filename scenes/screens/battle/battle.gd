extends Node2D

var opponent_poke: PokemonResourceDynamic
var player_poke: PokemonResourceDynamic


func _ready():
	var game_save = Global.data.get('game-save')
	setup(game_save.captured_pokemons[0], game_save.captured_pokemons[1])
	$CombatWidgets/PlayerWidget.setup(player_poke)
	$CombatWidgets/OpponentWidget.setup(opponent_poke)


func setup(player: PokemonResourceDynamic, opponent: PokemonResourceDynamic):
	opponent_poke = opponent
	player_poke = player

	var player_poke_res: PokemonResource = PokemonLoader.entries[player_poke.pokemon_resource_id]
	var opponent_poke_res: PokemonResource = PokemonLoader.entries[opponent_poke.pokemon_resource_id]
	$Player.texture = player_poke_res.back_texture
	$Opponent.texture = opponent_poke_res.texture
