extends "res://screens/abstract_screen.gd"

func _ready():
	$AnimationPlayer.play("credits")

func _on_back_button():
	change_scene()

func _on_itch_button():
	OS.shell_open("https://pigdev.itch.io")
