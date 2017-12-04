extends TextureProgress
const FEEDBACK = preload("res://objects/gauge/price_feedback.tscn")

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
	player.current = calc_spread()
	if calc_spread() < 30 or calc_spread() > 70:
		get_parent().change_scene("res://screens/lose/lose_screen.tscn")
		return
	var l = FEEDBACK.instance()
	l.set("custom_colors/font_color", Color("c95854"))
	if calc_spread() < 50:
		l.set_text("price decreased")
		player.tile_price -= 25
		l.amount = Vector2(0, 25)
		l.set_position($Supply.get_position() + Vector2(0, -25))
	else:
		l.set_text("price increased")
		player.tile_price += 25
		l.amount = Vector2(0, -25)
		l.set_position($Demand.get_position() + Vector2(0, 25))
	add_child(l)

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
	return(spread)