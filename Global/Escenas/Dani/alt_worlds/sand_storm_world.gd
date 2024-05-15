extends Node2D

signal wind_force(vector: Vector2, wind: bool)

@onready var sand_storm_complete: bool = false
@onready var wind_force_vector: Vector2 = Vector2(160,0)

func _ready():
	$timers/stop_sand.start(3.25)
	if(Global.change == "node_2d-sand_storm_world"):
		$TileMap/Personaje.global_position = $"spawn_point/node_2d-sand_storm_world".global_position
	emit_signal("wind_force", wind_force_vector, false)

func _process(_delta):
	if(!sand_storm_complete):
		if($safe_zones/area_safe.has_overlapping_bodies() || $safe_zones/area_safe2.has_overlapping_bodies() || $safe_zones/area_safe3.has_overlapping_bodies() || $safe_zones/area_safe4.has_overlapping_bodies() || $safe_zones/area_safe5.has_overlapping_bodies() || $safe_zones/area_safe6.has_overlapping_bodies()):
			emit_signal("wind_force", wind_force_vector, false)
		else:
			if($timers/stop_sand.time_left > 0):
				wind_force_vector = Vector2(0,0)
				emit_signal("wind_force", wind_force_vector, false)
			else:
				wind_force_vector = Vector2(160,0)
				emit_signal("wind_force", wind_force_vector, true)

func _on_start_sand_timeout():
	$particles/sand_storm_activated.emitting = false
	$particles/sand_storm_activated2.emitting = false
	$particles/sand_storm_activated3.emitting = false
	$particles/sand_storm_activated4.emitting = false
	$timers/stop_sand.start(3.25)
	
	


func _on_stop_sand_timeout():
	$particles/sand_storm_activated.emitting = true
	$particles/sand_storm_activated2.emitting = true
	$particles/sand_storm_activated3.emitting = true
	$particles/sand_storm_activated4.emitting = true
	$timers/start_sand.start(3.25)


func _on_area_2d_body_entered(body):
	if(body.is_in_group("Player")):
		if(!sand_storm_complete):
			$particles/sand_storm_activated.emitting = false
			$particles/sand_storm_activated2.emitting = false
			$particles/sand_storm_activated3.emitting = false
			$particles/sand_storm_activated4.emitting = false
			$timers/start_sand.queue_free()
			$timers/stop_sand.queue_free()
			sand_storm_complete = true
			emit_signal("wind_force", wind_force_vector, false)
