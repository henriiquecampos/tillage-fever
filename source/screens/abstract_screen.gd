extends Control
export (String, FILE, "*.tscn") var next_scene

func _ready():
	accorn_rain.show()
	
func change_scene(scene = next_scene, which = null):
	get_tree().change_scene(scene)