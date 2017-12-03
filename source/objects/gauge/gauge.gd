extends TextureProgress

func _ready():
	player.connect("demand_changed", self, "update_demand")
	player.connect("supply_changed", self, "update_supply")
	set_max(player.demand)
	set_value(player.supply)
	
func update_demand(demand):
	var t = $Tween
	t.interpolate_method(self, "set_max", get_max(), demand, 0.5,
	t.TRANS_ELASTIC, t.EASE_OUT)
	t.start()
	
func update_supply(supply):
	var t = $Tween
	t.interpolate_method(self, "set_value", get_value(), supply, 0.5,
	t.TRANS_ELASTIC, t.EASE_OUT)
	t.start()

func check_supply_demand():
	var spread = max_value - value
	spread = (spread * 100)/max_value
	var dif = (abs(spread - (value*100/max_value)))
	if dif >= 30:
		get_parent().change_scene("res://screens/lose/lose_screen.tscn")
	if player.supply > player.demand:
		player.tile_price -= 25
	elif player.supply < player.demand:
		player.tile_price += 25