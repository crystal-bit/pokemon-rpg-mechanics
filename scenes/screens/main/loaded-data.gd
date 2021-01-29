extends Label

func _ready() -> void:
	var data = [len(PokemonLoader.entries), len(PokemonLoader.moves)]
	text = "Pokemon loaded: %s \nMoves loaded: %s" % data
