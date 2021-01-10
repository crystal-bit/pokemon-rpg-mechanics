extends Node2D

export(Resource) var pokemon_data

# load pokemon original data
# load actual pokemon id and stats
# we have 2 kinds of information:
# 1. static information (never changes)
#    1. eg: base stats
# 2. variable information (changes between pokemons)
#    1. eg: effort values, individual values, nature

func _ready():
	pass # Replace with function body.
