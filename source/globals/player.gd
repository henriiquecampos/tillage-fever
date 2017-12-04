extends Node
const DEFAULT_SCORE = 5000
const DEFAULT_PRICE = 200
const DEFAULT_SUPPLY = 0
const DEFAULT_DEMAND = 100

var current_score = DEFAULT_SCORE setget set_current_score
var tile_price = DEFAULT_PRICE setget set_tile_price
var supply = DEFAULT_SUPPLY setget set_supply
var demand = DEFAULT_DEMAND setget set_demand

signal score_changed(value)
signal supply_changed(value)
signal demand_changed(value)
signal price_changed(value)

func set_tile_price(value):
	tile_price = value
	emit_signal("price_changed", tile_price)
	
func set_current_score(value):
	current_score = value
	emit_signal("score_changed", current_score)
	
func set_supply(value):
	supply = value
	emit_signal("supply_changed", supply)

func set_demand(value):
	demand = value
	emit_signal("demand_changed", demand)
	
func reset_values():
	current_score = DEFAULT_SCORE
	tile_price = DEFAULT_PRICE
	supply = DEFAULT_SUPPLY 
	demand = DEFAULT_DEMAND