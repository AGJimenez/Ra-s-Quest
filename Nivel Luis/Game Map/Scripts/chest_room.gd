extends Node2D


func _ready():
	if Global.change == "night-chest":
		$Player.global_position = $"night-chest".global_position

func _on_chest_area_body_entered(body):
	Global.change = "chest-night"
	LoadManager.load_scene("res://Rooms/night_room.tscn")
	

