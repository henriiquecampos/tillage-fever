extends Control
export (String, FILE, "*.tscn") var next_scene

func _ready():
	accorn_rain.show()
	
func change_scene(scene = next_scene, which = null):
	get_tree().change_scene(scene)
	
func _on_button_down():
	sfx_player.set_stream(sfx_player.click)
	sfx_player.play()