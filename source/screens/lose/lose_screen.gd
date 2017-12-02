extends "res://screens/abstract_screen.gd"

func _on_try_again():
	player.reset_values()
	change_scene()

func _on_quit():
	get_tree().quit()

func _on_back_main_menu():
	player.reset_values()
	change_scene("res://screens/main/main_screen.tscn")
