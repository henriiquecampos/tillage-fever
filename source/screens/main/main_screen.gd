extends "res://screens/abstract_screen.gd"

func _ready():
	for c in $Buttons.get_children():
		c.connect("button_up", self, "change_scene",[next_scene, c])
		c.connect("button_down", self, "_on_button_down")


func change_scene(scene = next_scene, which = null):
	if which.get_index() == 0:
		next_scene = "res://screens/gameplay/play_screen.tscn"
	elif which.get_index() == 1:
		next_scene = "res://screens/options/options_screen.tscn"
	elif which.get_index() == 2:
		next_scene = "res://screens/credits/credits_screen.tscn"
	elif which.get_index() == 3:
		get_tree().quit()
		return
	.change_scene(next_scene, which)