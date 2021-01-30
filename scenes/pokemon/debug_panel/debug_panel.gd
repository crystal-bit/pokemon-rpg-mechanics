extends PopupPanel

onready var c := $VBoxContainer


func clear():
	for el in c.get_children():
		el.queue_free()


func add_poke_resource_labels(pokemon_resource):
	clear()
	yield(get_tree(), "idle_frame")
	var header = Label.new()
	header.text = '--- ' + str(pokemon_resource)
	c.add_child(header)
	for prop in pokemon_resource.get_property_list():
		var p = prop.name
		if not p in ['type', 'name', 'hp', 'id', 'attack', 'defense', 'type', 'type2', 'special_attack', 'special_defense']:
			continue
		var l = Label.new()
		l.text = p + ": " + str(pokemon_resource[p])
		c.add_child(l)


func add_poke_resource_dynamic_labels(pokemon_resource_dynamic: PokemonResourceDynamic):
	var tmp = Label.new()
	tmp.text = '--- ' + str(pokemon_resource_dynamic)
	c.add_child(tmp)
	for prop in pokemon_resource_dynamic.get_property_list():
		print(prop)
		var p = prop.name
		if not p in ['experience', 'pokemon_unique_id', 'pokemon_id', 'level', 'effort_values']:
			continue
		var l = Label.new()
		l.text = p + ": " + str(pokemon_resource_dynamic[p])
		c.add_child(l)


func add_pokemon_moves_labeles(pokemon_resource_dynamic):
	c.add_child(HSeparator.new())
	var prop: PokemonMoveSet = pokemon_resource_dynamic.move_set
	var idx = 0
	for move in prop.current_moves:
		var l = Label.new()
		l.text = "#%d: %s" % [idx, move]
		c.add_child(l)
		idx += 1


func update_labels(pokemon_resource_dynamic: PokemonResourceDynamic):
	var pokemon_resource: PokemonResource = PokemonLoader.entries[pokemon_resource_dynamic.pokemon_resource_id]
	add_poke_resource_labels(pokemon_resource)
	if pokemon_resource_dynamic:
		add_poke_resource_dynamic_labels(pokemon_resource_dynamic)
		add_pokemon_moves_labeles(pokemon_resource_dynamic)
	yield(get_tree(), "idle_frame")
	set_as_minsize()
	popup_centered()

