extends "res://screens/abstract_screen.gd"

func _ready():
	$AnimationPlayer.play("text")
	
func _on_play_again():
	player.reset_values()
	change_scene()
