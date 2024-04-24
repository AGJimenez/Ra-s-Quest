extends Node2D


func _ready():
	if Global.change == "night-chest":
		$room/Player.global_position = $"Spawn_points/night-chest".global_position



func _on_chest_area_night_body_entered(body):
	if(body.is_in_group("Player")):
		Global.change = "chest-night"
		LoadManager.load_scene("res://Rooms/night_room.tscn")
