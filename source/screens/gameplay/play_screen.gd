extends "res://screens/abstract_screen.gd"

onready var time = $Time
onready var time_text = time.get_text()
onready var score = $Score
onready var score_text = score.get_text()
onready var initial_score = player.current_score

var current_time = 0.0
var days = 90

func _ready():
	randomize()
	player.connect("score_changed", self, "update_score")
	time.set_text(time_text.format({"amount":days}))
	score.set_text(score_text.format({"amount":initial_score}))
	accorn_rain.hide()

func _process(delta):
	if days >= 0:
		current_time += delta
		if current_time >= 1.0:
			days -= 1
			update_days(days)
			current_time = 0.0

func update_score(value):
	score.set_text(score_text.format({"amount":value}))
	
func update_days(value):
	if value <= 0:
		next_scene = "res://screens/win/win_screen.tscn"
		change_scene()
	time.set_text(time_text.format({"amount":value}))
	if value%5 == 0:
		if player.current_score <= 0:
			next_scene = "res://screens/lose/lose_screen.gd"
			change_scene()
			return
		$Gauge.check_supply_demand()
		$Field/Tilemap.changed_tiles(value)
		sfx_player.set_stream(sfx_player.harvest)
		sfx_player.play()
		update_player_demand()

func update_player_demand():
	var new_demand = int(rand_range(player.demand/2, player.demand * 2))
	if (player.demand + new_demand) <= 8000:
		player.demand = new_demand
	else:
		update_player_demand()