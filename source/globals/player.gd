extends Node

export (int) var current_score = 1200 setget set_current_score
export (int) var tile_price = 200

signal score_change(score)

func set_current_score(value):
	current_score = value
	emit_signal("score_change", current_score)