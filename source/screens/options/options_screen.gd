extends "res://screens/abstract_screen.gd"

var sfx_volume = 0 setget set_sfx_volume
var bgm_volume = 0 setget set_bgm_volume

func _ready():
	$Controls/SFXVolume.connect("value_changed", self, "set_sfx_volume")
	$Controls/BGMVolume.connect("value_changed", self, "set_bgm_volume")
	$Controls/SFXVolume.set_value(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))
	$Controls/BGMVolume.set_value(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("BGM")))
func set_sfx_volume(volume):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), volume)
	
func set_bgm_volume(volume):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("BGM"), volume)

func _on_back():
	change_scene()
