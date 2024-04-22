extends Node2D


func _ready():
	if Global.change == "chest-night":
		$Player.global_position = $"chest-night".global_position
	
	if Global.change == "torch-night":
		$Player.global_position = $"torch-night".global_position

func _on_night_area_body_entered(body):
	Global.change = "night-chest"
	LoadManager.load_scene("res://Rooms/chest_room.tscn")
	


func _on_night_area_2_body_entered(body):
	Global.change = "night-torch"
	LoadManager.load_scene("res://Rooms/torch_room.tscn")
