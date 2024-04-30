extends Node2D

var area_1_movable = false
var area_2_movable = false
var area_3_movable = false
var area_4_movable = false
var area_1_player = false
var area_2_player = false
var area_3_player = false
var area_4_player = false

@onready var shadow_red = $StaticBody2D/objective/Shadow/AnimationPlayer
@onready var light_red = $StaticBody2D/objective/light_floor/AnimationPlayer

func _process(delta):
	if((area_1_movable && area_2_movable && area_3_movable && (area_1_player || area_2_player || area_3_player || area_4_player)) ||(area_1_movable && area_2_movable && area_4_movable && (area_1_player || area_2_player || area_3_player || area_4_player)) ||(area_2_movable && area_3_movable && area_4_movable && (area_1_player || area_2_player || area_3_player || area_4_player)) ||(area_1_movable && area_3_movable && area_4_movable && (area_1_player || area_2_player || area_3_player || area_4_player))):
		Global.activated = true
		if(Global.activated):
			light_red.play("red")
			shadow_red.play("red")
			

func _ready():
	if Global.change == "night-torch":
		$room/Player.global_position = $"Spawn_points/night-torch".global_position


func _on_torch_area_night_body_entered(body):
	if(body.is_in_group("Player") && !Global.activated):
		Global.change = "torch-night"
		LoadManager.load_scene("res://Rooms/night_room.tscn")


func _on_area_1_movable_body_entered(body):
	if(body.is_in_group("movable") && !Global.activated):
		area_1_movable = true
		$Statues/Statue/ray/AnimationPlayer.play("fade_in")


func _on_area_1_movable_body_exited(body):
	if(body.is_in_group("movable") && !Global.activated):
		area_1_movable = false
		$Statues/Statue/ray/AnimationPlayer.play("fade_out")


func _on_area_2_movable_body_entered(body):
	if(body.is_in_group("movable") && !Global.activated):
		area_2_movable = true
		$Statues/Statue2/ray/AnimationPlayer.play("fade_in")


func _on_area_2_movable_body_exited(body):
	if(body.is_in_group("movable") && !Global.activated):
		area_2_movable = false
		$Statues/Statue2/ray/AnimationPlayer.play("fade_out")


func _on_area_3_movable_body_entered(body):
	if(body.is_in_group("movable") && !Global.activated):
		area_3_movable = true
		$Statues/Statue_flip_h/ray/AnimationPlayer.play("fade_in")


func _on_area_3_movable_body_exited(body):
	if(body.is_in_group("movable") && !Global.activated):
		area_3_movable = false
		$Statues/Statue_flip_h/ray/AnimationPlayer.play("fade_out")


func _on_area_4_movable_body_entered(body):
	if(body.is_in_group("movable") && !Global.activated):
		area_4_movable = true
		$Statues/Statue_flip_h2/ray/AnimationPlayer.play("fade_in")


func _on_area_4_movable_body_exited(body):
	if(body.is_in_group("movable") && !Global.activated):
		area_4_movable = false
		$Statues/Statue_flip_h2/ray/AnimationPlayer.play("fade_out")


func _on_area_1_player_body_entered(body):
	if(body.is_in_group("Player") && !area_1_movable && !Global.activated):
		area_1_player = true
		$Statues/Statue/ray/AnimationPlayer.play("fade_in")


func _on_area_1_player_body_exited(body):
	if(body.is_in_group("Player") && !area_1_movable && !Global.activated):
		area_1_player = false
		$Statues/Statue/ray/AnimationPlayer.play("fade_out")


func _on_area_2_player_body_entered(body):
	if(body.is_in_group("Player") && !area_2_movable && !Global.activated):
		area_2_player = true
		$Statues/Statue2/ray/AnimationPlayer.play("fade_in")


func _on_area_2_player_body_exited(body):
	if(body.is_in_group("Player") && !area_2_movable && !Global.activated):
		area_2_player = false
		$Statues/Statue2/ray/AnimationPlayer.play("fade_out")


func _on_area_3_player_body_entered(body):
	if(body.is_in_group("Player") && !area_3_movable && !Global.activated):
		area_3_player = true
		$Statues/Statue_flip_h/ray/AnimationPlayer.play("fade_in")


func _on_area_3_player_body_exited(body):
	if(body.is_in_group("Player") && !area_3_movable && !Global.activated):
		area_3_player = false
		$Statues/Statue_flip_h/ray/AnimationPlayer.play("fade_out")


func _on_area_4_player_body_entered(body):
	if(body.is_in_group("Player") && !area_4_movable && !Global.activated):
		area_4_player = true
		$Statues/Statue_flip_h2/ray/AnimationPlayer.play("fade_in")


func _on_area_4_player_body_exited(body):
	if(body.is_in_group("Player") && !area_4_movable && !Global.activated):
		area_4_player = false
		$Statues/Statue_flip_h2/ray/AnimationPlayer.play("fade_out")
