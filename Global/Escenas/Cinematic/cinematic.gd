extends Node2D

@export_group("Cameras")
@export_subgroup("Intro")
@export var camera_intro_cinematic: Camera2D
@export var camera_intro: Camera2D
@export_subgroup("Mario")
@export var camera_mario_cinematic: Camera2D
@export var camera_mario: Camera2D
@export_subgroup("Dani")
@export var camera_dani_cinematic: Camera2D
@export var camera_dani: Camera2D
@export_subgroup("Rafa")
@export var camera_rafa_cinematic: Camera2D
@export var camera_rafa: Camera2D
@export_subgroup("Luis")
@export var camera_luis_cinematic: Camera2D
@export var camera_luis: Camera2D
@export_subgroup("Ale")
@export var camera_ale_cinematic: Camera2D
@export var camera_ale: Camera2D

@export_group("Player")
@export var player_intro: CharacterBody2D
@export var player_mario: CharacterBody2D
@export var player_dani: CharacterBody2D
@export var player_rafa: CharacterBody2D
@export var player_luis: CharacterBody2D
@export var player_ale: CharacterBody2D

@export_group("Animations")
@export var anim_global: AnimationPlayer
@export var anim_intro: AnimationPlayer
@export var anim_mario: AnimationPlayer
@export var anim_dani: AnimationPlayer
@export var anim_rafa: AnimationPlayer
@export var anim_luis: AnimationPlayer
@export var anim_ale: AnimationPlayer

@export_group("Black_screen")
@export var black_screen: ColorRect

#Nivel dani
@onready var panel = get_node("lvl_dani/Personaje/Camera2D/Panel")

func _ready():
	player_intro.set_physics_process(false)
	#player_mario.set_physics_process(false)
	player_dani.set_physics_process(false)
	player_rafa.set_physics_process(false)
	player_luis.set_physics_process(false)
	player_ale.set_physics_process(false)
	camera_intro_cinematic.enabled = false
	camera_intro.enabled = false
	#camera_mario_cinematic.enabled = false
	#camera_mario.enabled = false
	camera_dani_cinematic.enabled = false
	camera_dani.enabled = false
	#camera_rafa_cinematic.enabled = false
	camera_rafa.enabled = false
	#camera_luis_cinematic.enabled = false
	camera_luis.enabled = false
	camera_ale_cinematic.enabled = false
	camera_ale.enabled = false
	
	#//Start\\
	intro()
	await get_tree().create_timer(18).timeout
	mario()
	await get_tree().create_timer(0).timeout
	dani()
	await get_tree().create_timer(0).timeout
	rafa()
	await get_tree().create_timer(0).timeout
	luis()
	await get_tree().create_timer(0).timeout
	ale()
	
func intro():
	camera_intro_cinematic.zoom = Vector2(1,1)
	player_intro.position = Vector2(614,834)
	camera_intro_cinematic.enabled = true
	anim_intro.play("camara")
	#-5s
	await anim_intro.animation_finished
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/Cinematic/introduction.dialogue"),"introduction")
	camera_intro_cinematic.enabled = false
	camera_intro.enabled = true
	await get_tree().create_timer(9.5).timeout
	#-9.5s
	anim_global.play("fade")
	await anim_global.animation_finished
	#-0.5s
	camera_intro_cinematic.zoom = Vector2(2,2)
	camera_intro_cinematic.position = Vector2(577,-172)
	player_intro.position = Vector2(576,-81)
	anim_global.play("unfade")
	camera_intro_cinematic.enabled = true
	camera_intro.enabled = false
	await anim_global.animation_finished
	#-0.5s
	$intro/Personaje/AnimationPlayer.play("moveUp")
	anim_intro.play("entrance")
	await anim_intro.animation_finished
	#-2s
	player_intro.visible = false
	anim_global.play("fade")
	await anim_global.animation_finished
	#-0.5s
	$intro.queue_free()
	#Intro = 18s

func mario():
	#Mario = 20s
	pass

func dani():
	#Dani = 20s
	player_dani.visible = false
	camera_dani_cinematic.enabled = true
	await get_tree().create_timer(0.5).timeout
	anim_global.play("unfade")
	camera_dani_cinematic.position = Vector2(2126,1638)
	await anim_global.animation_finished
	anim_dani.play("room_1")
	await anim_dani.animation_finished
	anim_global.play("fade")
	await anim_global.animation_finished
	camera_dani_cinematic.position = Vector2(3104,1692)
	anim_global.play("unfade")
	await anim_global.animation_finished
	anim_dani.play("room_2")
	await anim_dani.animation_finished
	anim_global.play("fade")
	await anim_global.animation_finished
	anim_global.play("unfade")
	camera_dani_cinematic.queue_free()
	camera_dani.enabled = true
	player_dani.visible = true
	player_dani.position = Vector2(2000,1019)
	await anim_global.animation_finished
	pass

func rafa():
	#Rafa = 20s
	pass

func luis():
	#Luis = 20s
	pass

func ale():
	#Ale = 20s
	pass
