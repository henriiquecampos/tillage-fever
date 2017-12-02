extends TextureProgress

func _ready():
	player.connect("demand_changed", self, "update_demand")
	player.connect("supply_changed", self, "update_supply")
	
func update_demand(demand):
	set_max(demand)
	
func update_supply(supply):
	set_value(supply)

func check_supply_demand():
	var spread = max_value - value
	spread = (spread * 100)/max_value
	var dif = (abs(spread - (value*100/max_value)))
	if dif >= 30:
		print("game_over")