extends Node2D


func _ready():
	if Global.change == "night-torch":
		$room/Player.global_position = $"Spawn_points/night-torch".global_position


func _on_torch_area_night_body_entered(body):
	if(body.is_in_group("Player")):
		Global.change = "torch-night"
		LoadManager.load_scene("res://Rooms/night_room.tscn")
