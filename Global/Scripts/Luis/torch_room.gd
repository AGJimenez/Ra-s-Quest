extends Node2D

var area_1_movable = false
var area_2_movable = false
var area_3_movable = false
var area_4_movable = false
var area_1_player = false
var area_2_player = false
var area_3_player = false
var area_4_player = false
var chest = false
var chest_complete = false
var chest_h = false
var chest_h_complete = false
var chest_flip_h = false
var chest_flip_h_complete = false
var chest_flip_h2 = false
var chest_flip_h2_complete = false
var talk = false
var pickable = false
var talked = false
var done = false
var easter_egg_done = false

signal key_complete
signal mario_piece
signal dani_piece
signal rafa_piece
signal luis_piece


@onready var left_eye = $particles/left_eye
@onready var right_eye = $particles/right_eye
@onready var shadow_red = $"God Statue"/objective/Shadow/AnimationPlayer
@onready var light_red = $"God Statue"/objective/light_floor/AnimationPlayer

func _ready():
	Global.death = false
	$room.set_layer_enabled(1,false)
	if Global.change == "night-torch":
		$room/Player.global_position = $"Spawn_points/night-torch".global_position


func _process(_delta):
	if(!chest_complete && chest):
		if(Input.is_action_just_pressed("Interact")):
			emit_signal("dani_piece")
			Global.pieces_collected +=1
			chest_complete = true 
			$room/Player/interact.visible = false
	if(!chest_h_complete && chest_h):
		if(Input.is_action_just_pressed("Interact")):
			emit_signal("mario_piece")
			Global.pieces_collected +=1
			chest_h_complete = true 
			$room/Player/interact.visible = false
	if(!chest_flip_h_complete && chest_flip_h):
		if(Input.is_action_just_pressed("Interact")):
			emit_signal("luis_piece")
			Global.pieces_collected +=1
			chest_flip_h_complete = true
			$room/Player/interact.visible = false
	if(!chest_flip_h2_complete && chest_flip_h2):
		if(Input.is_action_just_pressed("Interact")):
			emit_signal("rafa_piece")
			Global.pieces_collected +=1
			chest_flip_h2_complete = true
			$room/Player/interact.visible = false
	if(Global.pieces_collected == 4 && !easter_egg_done):
		emit_signal("key_complete")
		Save.save_dict["key_collected"] = true
		Save.save_game()
		easter_egg_done = true
		
	if(!Global.death):
		if(Global.dialogue_state):
			$room/Player.animTree["parameters/conditions/idle"] = true
			$room/Player.animTree["parameters/conditions/is_moving"] = false
			$room/Player.set_physics_process(false)
			$room/Player.set_process(false)
		if(!Global.dialogue_state && !talked):
			$room/Player.set_physics_process(true)
			$room/Player.set_process(true)
	if(!done &&((area_1_movable && area_2_movable && area_3_movable && (area_1_player || area_2_player || area_3_player || area_4_player)) ||(area_1_movable && area_2_movable && area_4_movable && (area_1_player || area_2_player || area_3_player || area_4_player)) ||(area_2_movable && area_3_movable && area_4_movable && (area_1_player || area_2_player || area_3_player || area_4_player)) ||(area_1_movable && area_3_movable && area_4_movable && (area_1_player || area_2_player || area_3_player || area_4_player)))):
		if(!Global.activated):
			$room/Player.animTree["parameters/conditions/idle"] = true
			$room/Player.animTree["parameters/conditions/is_moving"] = false
			$room/Player.set_physics_process(false)
			$room/Player.set_process(false)
			await get_tree().create_timer(1).timeout
			$room/Player.set_physics_process(true)
			$room/Player.set_process(true)
		Global.activated = true
		if(Global.activated):
			light_red.play("red")
			shadow_red.play("red")
			left_eye.emitting = true
			right_eye.emitting = true
			$"room/Player/little torch".visible = false
			if(Input.is_action_just_pressed("Interact") && talk && !talked):
				$room/Player/talk_to_god.visible = false
				talked = true
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Luis/torch_room/anubis_final_dialog.dialogue"), "anubis_angry")
	if(!Global.dialogue_state && talked && !done):
		done = true
		await get_tree().create_timer(0.9).timeout
		$room.set_layer_enabled(1,true)
		await get_tree().create_timer(0.5).timeout
		$room/Player/fall_player.play("fall")
		$fall/fall.play("fall")
		await get_tree().create_timer(2).timeout
		$room/Player.visible = false
		Global.change = "torch-world"
		LoadManager.load_scene("res://Escenas/nivelAle/world.tscn")
				


func _on_torch_area_night_body_entered(body):
	if(body.is_in_group("Player") && !Global.activated):
		Global.change = "torch-night"
		LoadManager.load_scene("res://Escenas/Luis/Rooms/night_room.tscn")


func _on_area_1_movable_body_entered(body):
	if(body.is_in_group("movable") && !Global.activated):
		area_1_movable = true
		if($Statues/Statue/ray/AnimationPlayer.is_playing()):
			var anim_seconds = $Statues/Statue/ray/AnimationPlayer.get_current_animation_position()
			$Statues/Statue/ray/AnimationPlayer.play("fade_in")
			$Statues/Statue/ray/AnimationPlayer.advance(1 - anim_seconds)
		else:
			$Statues/Statue/ray/AnimationPlayer.play("fade_in")


func _on_area_1_movable_body_exited(body):
	if(body.is_in_group("movable") && !Global.activated):
		area_1_movable = false
		if($Statues/Statue/ray/AnimationPlayer.is_playing()):
			var anim_seconds = $Statues/Statue/ray/AnimationPlayer.get_current_animation_position()
			$Statues/Statue/ray/AnimationPlayer.play("fade_out")
			$Statues/Statue/ray/AnimationPlayer.advance(1 - anim_seconds)
		else:
			$Statues/Statue/ray/AnimationPlayer.play("fade_out")


func _on_area_2_movable_body_entered(body):
	if(body.is_in_group("movable") && !Global.activated):
		area_2_movable = true
		if($Statues/Statue2/ray/AnimationPlayer.is_playing()):
			var anim_seconds = $Statues/Statue2/ray/AnimationPlayer.get_current_animation_position()
			$Statues/Statue2/ray/AnimationPlayer.play("fade_in")
			$Statues/Statue2/ray/AnimationPlayer.advance(1 - anim_seconds)
		else:
			$Statues/Statue2/ray/AnimationPlayer.play("fade_in")


func _on_area_2_movable_body_exited(body):
	if(body.is_in_group("movable") && !Global.activated):
		area_2_movable = false
		if($Statues/Statue2/ray/AnimationPlayer.is_playing()):
			var anim_seconds = $Statues/Statue2/ray/AnimationPlayer.get_current_animation_position()
			$Statues/Statue2/ray/AnimationPlayer.play("fade_out")
			$Statues/Statue2/ray/AnimationPlayer.advance(1 - anim_seconds)
		else:
			$Statues/Statue2/ray/AnimationPlayer.play("fade_out")


func _on_area_3_movable_body_entered(body):
	if(body.is_in_group("movable") && !Global.activated):
		area_3_movable = true
		if($Statues/Statue_flip_h/ray/AnimationPlayer.is_playing()):
			var anim_seconds = $Statues/Statue_flip_h/ray/AnimationPlayer.get_current_animation_position()
			$Statues/Statue_flip_h/ray/AnimationPlayer.play("fade_in")
			$Statues/Statue_flip_h/ray/AnimationPlayer.advance(1 - anim_seconds)
		else:
			$Statues/Statue_flip_h/ray/AnimationPlayer.play("fade_in")


func _on_area_3_movable_body_exited(body):
	if(body.is_in_group("movable") && !Global.activated):
		area_3_movable = false
		if($Statues/Statue_flip_h/ray/AnimationPlayer.is_playing()):
			var anim_seconds = $Statues/Statue_flip_h/ray/AnimationPlayer.get_current_animation_position()
			$Statues/Statue_flip_h/ray/AnimationPlayer.play("fade_out")
			$Statues/Statue_flip_h/ray/AnimationPlayer.advance(1 - anim_seconds)
		else:
			$Statues/Statue_flip_h/ray/AnimationPlayer.play("fade_out")


func _on_area_4_movable_body_entered(body):
	if(body.is_in_group("movable") && !Global.activated):
		area_4_movable = true
		if($Statues/Statue_flip_h2/ray/AnimationPlayer.is_playing()):
			var anim_seconds = $Statues/Statue_flip_h2/ray/AnimationPlayer.get_current_animation_position()
			$Statues/Statue_flip_h2/ray/AnimationPlayer.play("fade_in")
			$Statues/Statue_flip_h2/ray/AnimationPlayer.advance(1 - anim_seconds)
		else:
			$Statues/Statue_flip_h2/ray/AnimationPlayer.play("fade_in")


func _on_area_4_movable_body_exited(body):
	if(body.is_in_group("movable") && !Global.activated):
		area_4_movable = false
		if($Statues/Statue_flip_h2/ray/AnimationPlayer.is_playing()):
			var anim_seconds = $Statues/Statue_flip_h2/ray/AnimationPlayer.get_current_animation_position()
			$Statues/Statue_flip_h2/ray/AnimationPlayer.play("fade_out")
			$Statues/Statue_flip_h2/ray/AnimationPlayer.advance(1 - anim_seconds)
		else:
			$Statues/Statue_flip_h2/ray/AnimationPlayer.play("fade_out")


func _on_area_1_player_body_entered(body):
	if(body.is_in_group("Player") && !area_1_movable && !Global.activated):
		area_1_player = true
		if($Statues/Statue/ray/AnimationPlayer.is_playing()):
			var anim_seconds = $Statues/Statue/ray/AnimationPlayer.get_current_animation_position()
			$Statues/Statue/ray/AnimationPlayer.play("fade_in")
			$Statues/Statue/ray/AnimationPlayer.advance(1 - anim_seconds)
		else:
			$Statues/Statue/ray/AnimationPlayer.play("fade_in")


func _on_area_1_player_body_exited(body):
	if(body.is_in_group("Player") && !area_1_movable && !Global.activated):
		area_1_player = false
		if($Statues/Statue/ray/AnimationPlayer.is_playing()):
			var anim_seconds = $Statues/Statue/ray/AnimationPlayer.get_current_animation_position()
			$Statues/Statue/ray/AnimationPlayer.play("fade_out")
			$Statues/Statue/ray/AnimationPlayer.advance(1 - anim_seconds)
		else:
			$Statues/Statue/ray/AnimationPlayer.play("fade_out")


func _on_area_2_player_body_entered(body):
	if(body.is_in_group("Player") && !area_2_movable && !Global.activated):
		area_2_player = true
		if($Statues/Statue2/ray/AnimationPlayer.is_playing()):
			var anim_seconds = $Statues/Statue2/ray/AnimationPlayer.get_current_animation_position()
			$Statues/Statue2/ray/AnimationPlayer.play("fade_in")
			$Statues/Statue2/ray/AnimationPlayer.advance(1 - anim_seconds)
		else:
			$Statues/Statue2/ray/AnimationPlayer.play("fade_in")


func _on_area_2_player_body_exited(body):
	if(body.is_in_group("Player") && !area_2_movable && !Global.activated):
		area_2_player = false
		if($Statues/Statue2/ray/AnimationPlayer.is_playing()):
			var anim_seconds = $Statues/Statue2/ray/AnimationPlayer.get_current_animation_position()
			$Statues/Statue2/ray/AnimationPlayer.play("fade_out")
			$Statues/Statue2/ray/AnimationPlayer.advance(1 - anim_seconds)
		else:
			$Statues/Statue2/ray/AnimationPlayer.play("fade_out")


func _on_area_3_player_body_entered(body):
	if(body.is_in_group("Player") && !area_3_movable && !Global.activated):
		area_3_player = true
		if($Statues/Statue_flip_h/ray/AnimationPlayer.is_playing()):
			var anim_seconds = $Statues/Statue_flip_h/ray/AnimationPlayer.get_current_animation_position()
			$Statues/Statue_flip_h/ray/AnimationPlayer.play("fade_in")
			$Statues/Statue_flip_h/ray/AnimationPlayer.advance(1 - anim_seconds)
		else:
			$Statues/Statue_flip_h/ray/AnimationPlayer.play("fade_in")


func _on_area_3_player_body_exited(body):
	if(body.is_in_group("Player") && !area_3_movable && !Global.activated):
		area_3_player = false
		if($Statues/Statue_flip_h/ray/AnimationPlayer.is_playing()):
			var anim_seconds = $Statues/Statue_flip_h/ray/AnimationPlayer.get_current_animation_position()
			$Statues/Statue_flip_h/ray/AnimationPlayer.play("fade_out")
			$Statues/Statue_flip_h/ray/AnimationPlayer.advance(1 - anim_seconds)
		else:
			$Statues/Statue_flip_h/ray/AnimationPlayer.play("fade_out")


func _on_area_4_player_body_entered(body):
	if(body.is_in_group("Player") && !area_4_movable && !Global.activated):
		area_4_player = true
		if($Statues/Statue_flip_h2/ray/AnimationPlayer.is_playing()):
			var anim_seconds = $Statues/Statue_flip_h2/ray/AnimationPlayer.get_current_animation_position()
			$Statues/Statue_flip_h2/ray/AnimationPlayer.play("fade_in")
			$Statues/Statue_flip_h2/ray/AnimationPlayer.advance(1 - anim_seconds)
		else:
			$Statues/Statue_flip_h2/ray/AnimationPlayer.play("fade_in")


func _on_area_4_player_body_exited(body):
	if(body.is_in_group("Player") && !area_4_movable && !Global.activated):
		area_4_player = false
		if($Statues/Statue_flip_h2/ray/AnimationPlayer.is_playing()):
			var anim_seconds = $Statues/Statue_flip_h2/ray/AnimationPlayer.get_current_animation_position()
			$Statues/Statue_flip_h2/ray/AnimationPlayer.play("fade_out")
			$Statues/Statue_flip_h2/ray/AnimationPlayer.advance(1 - anim_seconds)
		else:
			$Statues/Statue_flip_h2/ray/AnimationPlayer.play("fade_out")


func _on_area_chest_body_entered(body):
	if(body.is_in_group("Player") && !chest_complete && Save.save_dict["gem_dani"] && !Save.save_dict["key_collected"] && !Global.activated):
		chest = true
		$room/Player/interact.visible = true


func _on_area_chest_body_exited(body):
	if(body.is_in_group("Player") && !chest_complete):
		chest = false
		$room/Player/interact.visible = false


func _on_area_chest_h_body_entered(body):
	if(body.is_in_group("Player") && !chest_h_complete && Save.save_dict["gem_mario"] && !Save.save_dict["key_collected"] && !Global.activated):
		chest_h = true
		$room/Player/interact.visible = true


func _on_area_chest_h_body_exited(body):
	if(body.is_in_group("Player") && !chest_h_complete):
		chest_h = false
		$room/Player/interact.visible = false


func _on_area_chest_flip_h_body_entered(body):
	if(body.is_in_group("Player") && !chest_flip_h_complete && Save.save_dict["gem_luis"] && !Save.save_dict["key_collected"] && !Global.activated):
		chest_flip_h = true
		$room/Player/interact.visible = true


func _on_area_chest_flip_h_body_exited(body):
	if(body.is_in_group("Player") && !chest_flip_h_complete):
		chest_flip_h = false
		$room/Player/interact.visible = false


func _on_area_flip_h_2_body_entered(body):
	if(body.is_in_group("Player") && !chest_flip_h2_complete && Save.save_dict["gem_rafa"] && !Save.save_dict["key_collected"] && !Global.activated):
		chest_flip_h2 = true
		$room/Player/interact.visible = true


func _on_area_flip_h_2_body_exited(body):
	if(body.is_in_group("Player") && !chest_flip_h2_complete):
		chest_flip_h2 = false
		$room/Player/interact.visible = false


func _on_area_talk_body_entered(body):
	if(body.is_in_group("Player") && Global.activated && !talked):
		$room/Player/talk_to_god.visible = true
		talk = true
		


func _on_area_talk_body_exited(body):
	if(body.is_in_group("Player") && Global.activated):
		$room/Player/talk_to_god.visible = false
		talk = false
