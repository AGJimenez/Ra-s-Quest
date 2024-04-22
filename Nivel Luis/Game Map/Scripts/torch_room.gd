extends Node2D


func _ready():
	if Global.change == "night-torch":
		$Player.global_position = $"night-torch".global_position
	


func _on_torch_area_body_entered(body):
	Global.change = "torch-night"
	LoadManager.load_scene("res://Rooms/night_room.tscn")
