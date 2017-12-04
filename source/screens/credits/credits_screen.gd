extends "res://screens/abstract_screen.gd"

func _ready():
	$AnimationPlayer.play("credits")
	$Back.connect("button_up", self, "_on_button_down")
	$ItchButton.connect("button_up", self, "_on_button_down")
	$ItchButton.connect("button_up", self, "_on_itch_button_down")

	
func _on_back_button():
	change_scene()

func _on_itch_button():
	$ItchButton.set_self_modulate(Color(1.0,1.0,1.0,1.0))
	OS.shell_open("https://pigdev.itch.io")

func _on_itch_button_down():
	$ItchButton.set_self_modulate(Color(0.7,0.7,0.7,1.0))

func _on_itch_mouse_entered():
	$ItchButton.set_self_modulate(Color(1.1,1.1,1.1,1.0))

func _on_itch_mouse_exited():
	$ItchButton.set_self_modulate(Color(1.0,1.0,1.0,1.0))
