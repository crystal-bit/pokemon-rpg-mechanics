extends PanelContainer


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and !event.echo and event.scancode == KEY_F1:
			visible = !visible


func update_labels(pokemon_resource: PokemonResource, pokemon_resource_dynamic: PokemonResourceDynamic):
	# add labels for pokemon resource data
	var c := $VBoxContainer
	var header = Label.new()
	header.text = '--- ' + str(pokemon_resource)
	c.add_child(header)
	for prop in pokemon_resource.get_property_list():
		var p = prop.name
		if not p in ['type', 'name', 'hp', 'id']:
			continue
		var l = Label.new()
		l.text = p + ": " + str(pokemon_resource[p])
		c.add_child(l)

	# add labels for pokemon resource dynamic data
	c.add_child(HSeparator.new())

	var tmp = Label.new()
	tmp.text = '--- ' + str(pokemon_resource_dynamic)
	c.add_child(tmp)

	for prop in pokemon_resource_dynamic.get_property_list():
		var p = prop.name
		if not p in ['experience', 'pokemon_unique_id', 'pokemon_id', 'level', 'effort_values']:
			continue
		var l = Label.new()
		l.text = p + ": " + str(pokemon_resource_dynamic[p])
		c.add_child(l)

	# add labels for pokemon moves
	c.add_child(HSeparator.new())
	var prop: PokemonMoveSet = pokemon_resource_dynamic.move_set
	var idx = 0
	for move in prop.current_moves:
		var l = Label.new()
		l.text = "#%d: %s" % [idx, move]
		c.add_child(l)
		idx += 1
	return
