extends Node

onready var battle: Battle = get_parent()
onready var turn := battle.get_node("Turn")
onready var combat_widgets := battle.get_node("CombatWidgets")
onready var panel := battle.get_node("PanelManager")
onready var ai = $AI


func get_player_pokemon() -> PokemonResourceDynamic:
	return battle.player_poke


func get_opponent_pokemon() -> PokemonResourceDynamic:
	return battle.opponent_poke


func _on_MovesPanel_move_selected(move: PokemonMove) -> void:
	var msg = "%s used %s!" % [get_player_pokemon().get_pokemon_resource().name, move]
	panel.set_state(panel.STATES.INFO, msg)
	turn.next()
	handle_player_pokemon_move(move)


func _on_AI_move_decided(move: PokemonMove) -> void:
	var msg = "%s used %s!" % [get_opponent_pokemon().get_pokemon_resource().name, move]
	panel.set_state(panel.STATES.INFO, msg)
	handle_opponent_pokemon_move(move)


func handle_player_pokemon_move(move: PokemonMove):
	var opponent = get_opponent_pokemon()
	opponent.current_hp -= move.power
	opponent.current_hp = max(0, opponent.current_hp)
#	move.damage_class_id
#	move.target_id
	yield(combat_widgets.set_opponent_hp(opponent.current_hp), "completed")
	ai.opponent_turn()


func handle_opponent_pokemon_move(move: PokemonMove):
	var player = get_player_pokemon()
	player.current_hp -= move.power
	player.current_hp = max(0, player.current_hp)
	yield(combat_widgets.set_player_hp(player.current_hp), "completed")
	turn.next()
