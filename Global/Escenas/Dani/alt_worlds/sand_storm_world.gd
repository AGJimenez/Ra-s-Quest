extends Node2D

signal wind_force(vector: Vector2, wind: bool)

@onready var sand_storm_complete: bool = false
@onready var wind_force_vector: Vector2 = Vector2(160,0)
var zona_safe = 0
var isBalanzaPuzzleVisible = false

func _ready():
	$timers/stop_sand.start(3.25)
	$timers/start_transition.wait_time = 10.0
	$timers/start_transition.one_shot = true
	if(Global.change == "node_2d-sand_storm_world"):
		$TileMap/Personaje.global_position = $"spawn_point/node_2d-sand_storm_world".global_position
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/Conversacion_SandStorm_Inicio.dialogue"),"main")
	emit_signal("wind_force", wind_force_vector, false)

func _process(_delta):
	if(!sand_storm_complete):
		if($safe_zones/area_safe.has_overlapping_bodies() || $safe_zones/area_safe2.has_overlapping_bodies() || $safe_zones/area_safe3.has_overlapping_bodies() || $safe_zones/area_safe4.has_overlapping_bodies() || $safe_zones/area_safe5.has_overlapping_bodies() || $safe_zones/area_safe6.has_overlapping_bodies()):
			emit_signal("wind_force", wind_force_vector, false)
			dialogos()
		else:
			if($timers/stop_sand.time_left > 0):
				wind_force_vector = Vector2(0,0)
				emit_signal("wind_force", wind_force_vector, false)
			else:
				wind_force_vector = Vector2(160,0)
				emit_signal("wind_force", wind_force_vector, true)
	
	if Input.is_action_just_pressed("Interact"):
		$TileMap/Personaje/Camera2D/CanvasLayer.visible = isBalanzaPuzzleVisible

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
		if Input.is_action_just_pressed("Interact"):
			$TileMap/Personaje/Camera2D/CanvasLayer/Control.visible = true


func dialogos():
	match zona_safe:
		1: 
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/pista_balanza_1.dialogue"),"main")
			zona_safe = 0
		2: 
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/pista_balanza_2.dialogue"),"main")
			zona_safe = 0
		3: 
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/pista_balanza_3.dialogue"),"main")
			zona_safe = 0
		4: 
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/pista_balanza_4.dialogue"),"main")
			zona_safe = 0
		5: 
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/pista_balanza_5.dialogue"),"main")
			zona_safe = 0

func _on_area_safe_2_body_entered(body):
	if(body.is_in_group("Player")):
		zona_safe = 1

func _on_area_safe_2_body_exited(body):
	zona_safe = 0

func _on_area_safe_3_body_entered(body):
	if(body.is_in_group("Player")):
		zona_safe = 2

func _on_area_safe_3_body_exited(body):
	zona_safe = 0

func _on_area_safe_4_body_entered(body):
	if(body.is_in_group("Player")):
		zona_safe = 3

func _on_area_safe_4_body_exited(body):
	zona_safe = 0

func _on_area_safe_5_body_entered(body):
	if(body.is_in_group("Player")):
		zona_safe = 4

func _on_area_safe_5_body_exited(body):
	zona_safe = 0

func _on_area_safe_6_body_entered(body):
	if(body.is_in_group("Player")):
		zona_safe = 5

func _on_area_safe_6_body_exited(body):
	zona_safe = 0


func _on_area_2d_balanza_body_entered(body):
	if(body.is_in_group("Player")):
		isBalanzaPuzzleVisible = true


func _on_area_2d_balanza_body_exited(body):
	if(body.is_in_group("Player")):
		isBalanzaPuzzleVisible = false


func _on_control_resultado_correcto():
	$TileMap/Personaje/Camera2D/CanvasLayer.visible = false
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Dani/Ultimo_DIalogo.dialogue"),"main")
	$timers/start_transition.start()


func _on_start_transition_timeout():
	Global.change = "sand_storm_world-node_2d"
	LoadManager.load_scene("res://Escenas/Dani/node_2d.tscn")
