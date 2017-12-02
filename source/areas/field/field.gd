extends TileMap

var last_cell = Vector2(15,15)
var current_tile = 1

func _ready():
	print()
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
			player.set_supply(player.supply + 10)
		else:
			set_cellv(cell, 0)
			player.set_current_score(int(player.current_score + (player.tile_price/2)))
			player.set_supply(player.supply - 10)
			
func changed_tiles(days):
	for c in get_used_cells():
		if get_cellv(c) >= (get_tileset().get_tiles_ids().size() -1):
			set_cellv(c, 0)
			player.set_supply(player.supply - 10)
			player.set_current_score(player.current_score + (player.tile_price * 2))
		elif get_cellv(c) >=1:
			set_cellv(c, get_cellv(c) + 1)