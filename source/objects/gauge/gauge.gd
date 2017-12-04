extends TextureProgress

func _ready():
	player.connect("demand_changed", self, "update_demand")
	player.connect("supply_changed", self, "update_supply")
	set_max(player.demand)
	set_value(player.supply)
	check_warning()

func update_demand(demand):
	var t = $Tween
	t.interpolate_method(self, "set_max", get_max(), demand, 0.5,
	t.TRANS_ELASTIC, t.EASE_OUT)
	t.start()
	check_warning()

func update_supply(supply):
	var t = $Tween
	t.interpolate_method(self, "set_value", get_value(), supply, 0.5,
	t.TRANS_ELASTIC, t.EASE_OUT)
	t.start()
	sfx_player.set_stream(sfx_player.sup_dem)
	sfx_player.play()
	check_warning()

func check_supply_demand():
	if calc_spread() < 30 or calc_spread() > 70:
		get_parent().change_scene("res://screens/lose/lose_screen.tscn")
	if player.supply > player.demand:
		player.tile_price -= 25
	elif player.supply < player.demand:
		player.tile_price += 25
		
func check_warning():
	if calc_spread() < 30 or calc_spread() > 70:
		$Warning.show()
		$Warning/AnimationPlayer.play("warning")
	else:
		$Warning.hide()
		$Warning/AnimationPlayer.stop()
		
func calc_spread():
	var dif = abs(player.demand - player.supply)
	var spread = (dif * 100)/player.demand
	print(spread)
	return(spread)