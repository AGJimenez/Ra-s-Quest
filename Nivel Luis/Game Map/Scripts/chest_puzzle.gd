extends Control

var radius = 120.0
var angle = 0.0
var speed = 1.5

var speed_rotation = 1.5
var radius_rotation = 120

var skill = false
var skill2 = false
var skill3 = false 
var skill4 = false
var complete1 = false
var complete2 = false
var complete3 = false
var complete4 = false

@onready var player_check = $player_check

func _ready():
	stop()
	$skill_checks.visible = false
	player_check.visible = false
	player_check.position = Vector2(radius_rotation, 0)
	
func _process(delta):
	circular_motion()
	player_check.rotation += speed_rotation * delta
	if(skill):
		if(Input.is_action_just_pressed("spacebar")):
			$skill_checks/Polygon2D/AnimationPlayer.play("activated")
			print("complete1")
			complete1 = true
			skill = false
	if(skill2):
		if(Input.is_action_just_pressed("spacebar")):
			$skill_checks/Polygon2D2/AnimationPlayer.play("activated")
			print("complete2")
			complete2 = true
			skill2 = false
	if(skill3):
		if(Input.is_action_just_pressed("spacebar")):
			$skill_checks/Polygon2D3/AnimationPlayer.play("activated")
			print("complete3")
			complete3 = true
			skill3 = false
	if(skill4):
		if(Input.is_action_just_pressed("spacebar")):
			$skill_checks/Polygon2D4/AnimationPlayer.play("activated")
			print("complete4")
			complete4 = true
			skill4 = false
	if(complete1 && complete2 && complete3 && complete4):
		player_check.visible = false
		stop()
		Global.chest_puzzle_complete = true
		await get_tree().create_timer(1).timeout
		Global.change = "chest_puzzle-chest"
		LoadManager.load_scene("res://Rooms/chest_room.tscn")
		
	if(Input.is_action_just_pressed("interact")):
		Global.change = "chest_puzzle-chest"
		LoadManager.load_scene("res://Rooms/chest_room.tscn")


func circular_motion():
	angle += speed * get_process_delta_time()
	var x_pos = cos(angle)
	var y_pos = sin(angle)
	
	player_check.position.x = radius * x_pos + 553
	player_check.position.y = radius * y_pos + 238
	
func stop():
	radius = 0
	angle = 0
	speed = 0
	speed_rotation = 0
	radius_rotation = 0

func start():
	radius = 120.0
	angle = 0.0
	speed = 1.5
	speed_rotation = 1.5
	radius_rotation = 120


func _on_skill_check_zone_body_entered(body):
	if(body.is_in_group("Player")):
		skill = true


func _on_skill_check_zone_2_body_entered(body):
	if(body.is_in_group("Player")):
		skill2 = true


func _on_skill_check_zone_3_body_entered(body):
	if(body.is_in_group("Player")):
		skill3 = true


func _on_skill_check_zone_4_body_entered(body):
	if(body.is_in_group("Player")):
		skill4 = true


func _on_skill_check_zone_body_exited(body):
	if(body.is_in_group("Player")):
		skill = false


func _on_skill_check_zone_2_body_exited(body):
	if(body.is_in_group("Player")):
		skill2 = false


func _on_skill_check_zone_3_body_exited(body):
	if(body.is_in_group("Player")):
		skill3 = false


func _on_skill_check_zone_4_body_exited(body):
	if(body.is_in_group("Player")):
		skill4 = false


func _on_button_pressed():
	player_check.visible = true
	$skill_checks.visible = true
	start()
	$Button.disabled = true
