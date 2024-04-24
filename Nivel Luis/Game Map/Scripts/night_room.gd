extends Node2D


func _ready():
	if Global.change == "chest-night":
		$room/Player.global_position = $"Spawn_points/chest-night".global_position
	
	if Global.change == "torch-night":
		$room/Player.global_position = $"Spawn_points/torch-night".global_position


func _on_night_area_chest_body_entered(body):
	if(body.is_in_group("Player")):
		Global.change = "night-chest"
		LoadManager.load_scene("res://Rooms/chest_room.tscn")


func _on_night_area_torch_body_entered(body):
	if(body.is_in_group("Player")):
		Global.change = "night-torch"
		LoadManager.load_scene("res://Rooms/torch_room.tscn")
