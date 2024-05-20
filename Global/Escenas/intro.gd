extends Node2D

var intro_finished = false
var tree = false
var first_time = true

@onready var pause_menu = $Personaje/Camera2D/pause_menu
@onready var wasd = $Personaje/Camera2D/tutorial/tutorial_keys/wasd
@onready var e = $Personaje/Camera2D/tutorial/tutorial_keys/e
@onready var additional = $Personaje/Camera2D/tutorial/tutorial_keys/additional

func _ready():
	if(Save.save_dict["map_number"] < 0):
		number_changed()
		Save.save_dict["map"] = "res://Escenas/Luis/Rooms/chest_room.tscn"
		Save.save_game()
	$Personaje.set_process(false)
	$Personaje.set_physics_process(false)
	$AnimationPlayer.play("new_animation")
	$Personaje/Camera2D.enabled = false
	$AnimationPlayer2.play("camara")
	await $AnimationPlayer2.animation_finished
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/intro/controlesNpc.dialogue"),"this_is_a_node_title")
	$Personaje.set_process(true)
	$Personaje.set_physics_process(true)
	intro_finished = true
	$Camera2D.enabled = false
	$Personaje/Camera2D.enabled = true

func _process(delta):
	if(Global.controls_wasd):
		wasd.visible = true
	else:
		wasd.visible = false
	if(Global.controls_e):
		e.visible = true
	else:
		e.visible = false
	if(Global.controls_add):
		additional.visible = true
	else:
		additional.visible = false
	if(!Global.tutorial_on):
		$tutorial_escape/CollisionShape2D.disabled = true
	else:
		$tutorial_escape/CollisionShape2D.disabled = false

	if(Global.tutorial_on && Input.is_action_just_pressed("Interact") && tree && !Global.dialogue_state):
		tree = false
		$Personaje/press_e.visible = false
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/intro/tutorial_finished.dialogue"),"tutorial_end")
		
		
	if(intro_finished):
		if(Global.dialogue_state == true):
			$Personaje.velocity = Vector2.ZERO
			$Personaje.direction = Vector2.ZERO
			$Personaje.set_physics_process(false)
		if(Global.dialogue_state == false):
			$Personaje.set_physics_process(true)

		
func _on_area_2d_body_entered(body):
	if body.name == "Personaje":
		Global.change = "intro-nivelMario"
		LoadManager.load_scene("res://Escenas/nivel1_Mario/nivel_mario.tscn")

func number_changed():
	Save.save_dict["map_number"] = 0


func _on_tree_area_body_entered(body):
	if(body.is_in_group("Player") && Global.tutorial_on):
		$Personaje/press_e.visible = true
		if(first_time):
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/intro/tutorial_continue.dialogue"),"tutorial")
			first_time = false
		tree = true


func _on_tree_area_body_exited(body):
	if(body.is_in_group("Player") && Global.tutorial_on):
		$Personaje/press_e.visible = false
		tree = false



func _on_tutorial_area_body_entered(body):
	if(body.is_in_group("Player") && Global.tutorial_on):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/intro/tutorial_skip.dialogue"),"tutorial_skip_dialog")


