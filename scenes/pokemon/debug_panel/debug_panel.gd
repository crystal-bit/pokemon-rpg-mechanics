extends PanelContainer


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and !event.echo and event.scancode == KEY_F1:
			visible = !visible


func update_labels(pokemon_resource: PokemonResource, pokemon_resource_dynamic: PokemonResourceDynamic):
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
