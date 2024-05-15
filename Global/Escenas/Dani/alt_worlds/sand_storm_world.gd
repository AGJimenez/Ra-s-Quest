extends Node2D

signal wind_force(vector: Vector2, wind: bool)

@onready var wind_force_vector: Vector2 = Vector2(120,0)

func _ready():
	$timers/start_sand.start(3)
	if(Global.change == "node_2d-sand_storm_world"):
		$TileMap/Personaje.global_position = $"spawn_point/node_2d-sand_storm_world".global_position
	emit_signal("wind_force", wind_force_vector, false)


func _on_area_safe_body_entered(_body):
	emit_signal("wind_force", wind_force_vector, false)


func _on_area_safe_body_exited(_body):
	print($timers/start_sand.time_left)
	if($timers/start_sand.time_left > 0):
		emit_signal("wind_force", wind_force_vector, true)


func _on_start_sand_timeout():
	if($safe_zones/area_safe2.has_overlapping_bodies()):
		print($safe_zones/area_safe2.has_overlapping_bodies())
		pass
	else:
		emit_signal("wind_force", wind_force_vector, true)
	print("stop")
	$timers/stop_sand.start(3)
	
	


func _on_stop_sand_timeout():
	emit_signal("wind_force", wind_force_vector, false)
	print("start")
	$timers/start_sand.start(3)
