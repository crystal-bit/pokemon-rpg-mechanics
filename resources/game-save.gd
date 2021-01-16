extends Node

var bulbasaur = PokemonResourceDynamic.new({
	"unique_id": 1,
	"level": 30,
	"pokemon_id": 2,
	"effort_values": 10,
})

var game_save = {
	"captured_pokemon": [
		bulbasaur,
		{
			"unique_id": 2,
			"pokemon_id": 1,
			"level": 1,
			"effort_values": 1,
		}
	]
}
