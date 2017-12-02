extends TileMap

var last_cell = Vector2(15,15)
func _process(delta):
	if Input.is_action_pressed("click"):
		var current_cell = world_to_map(get_local_mouse_position())
		if (current_cell.x <= 9) and (current_cell.y <= 4):
			set_new_tile(current_cell)
		last_cell = current_cell
	elif Input.is_action_just_released("click"):
		last_cell = Vector2(15,15)

func set_new_tile(cell):
	if cell != last_cell:
		if ((get_cellv(cell)) == 0) and (player.current_score - player.tile_price >= 0):
			set_cellv(cell, 1)
			player.set_current_score(player.current_score - player.tile_price)
		else:
			set_cellv(cell, 0)
			player.set_current_score(int(player.current_score + (player.tile_price/2)))