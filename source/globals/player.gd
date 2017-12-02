extends Node

export (int) var current_score = 10000000 setget set_current_score
export (int) var tile_price = 200
var supply = 0 setget set_supply
var demand = 100 setget set_demand

signal score_changed(value)
signal supply_changed(value)
signal demand_changed(value)

func set_current_score(value):
	current_score = value
	emit_signal("score_change", current_score)
	
func set_supply(value):
	supply = value
	emit_signal("supply_changed", supply)

func set_demand(value):
	demand = value
	emit_signal("demand_changed", demand)