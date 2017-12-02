extends "res://screens/abstract_screen.gd"

onready var time = $Time
onready var time_text = time.get_text()
onready var score = $Score
onready var score_text = score.get_text()
onready var initial_score = player.current_score

var current_time = 0.0
var days = 90 setget set_days

func _ready():
	player.connect("score_change", self, "update_score")
	time.set_text(time_text.format({"amount":days}))
	score.set_text(score_text.format({"amount":initial_score}))


func update_score(value):
	score.set_text(score_text.format({"amount":value}))