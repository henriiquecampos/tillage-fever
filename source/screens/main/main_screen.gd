extends "res://screens/abstract_screen.gd"

func _ready():
	for c in $Buttons.get_children():
		c.connect("button_up", self, "change_scene",[next_scene, c])
		
func change_scene(scene = next_scene, which = null):
	print(which.get_index())
	if which.get_index() == 0:
		next_scene = "res://screens/gameplay/play_screen.tscn"
	elif which.get_index() == 1:
		next_scene = "res://screens/options/options_screen.tscn"
	elif which.get_index() == 2:
		next_scene = "res://screens/credits/credits_screen.tscn"
	.change_scene(next_scene, which)