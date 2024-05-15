extends CharacterBody2D
class_name Personaje

var push_force = 120
var direction: Vector2 = Vector2.ZERO
var input_enabled = true
var wind_enabled = false
var wind_force: Vector2 = Vector2.ZERO

@export var speed = 100
@export var inv: Inv

@onready var animTree: AnimationTree = $AnimationTree
@onready var anim = $AnimationPlayer
@onready var has_interacted = false


func _ready():
	animTree.active = true


func _process(_delta):
	update_animation()
	if(Global.dead && !Global.activated):
		set_physics_process(false)
		$Sprite2D.visible = false
		$AnimatedSprite2D.visible = true
		$AnimatedSprite2D.play("dead")
		Global.dead = false
		await get_tree().create_timer(1).timeout
		LoadManager.load_scene("res://Escenas/Luis/Rooms/torch_room.tscn")

# MÉTODO MOVILIDAD
func _physics_process(_delta):

	if input_enabled:
		direction = Input.get_vector("Left", "Right", "Up", "Down").normalized()
		if direction:
			if(!wind_enabled):
				velocity = direction * speed
				push_force = 120
			else:
				velocity = (direction * speed) + wind_force
		else:
			if(!wind_enabled):
				velocity = Vector2.ZERO
				push_force = 0
			else:
				velocity = wind_force
			

		move_and_slide()
		
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if(collision.get_collider() is RigidBody2D):
			collision.get_collider().apply_central_impulse(-collision.get_normal() * push_force)

func set_input_enabled(enabled):
	input_enabled = enabled

func update_animation():
	if(wind_enabled && !direction):
		animTree["parameters/conditions/idle"] = true
		animTree["parameters/conditions/is_moving"] = false
	elif(wind_enabled && direction):
		if (direction != Vector2.ZERO):
			animTree["parameters/conditions/idle"] = false
			animTree["parameters/conditions/is_moving"] = true
			animTree["parameters/stop/blend_position"] = direction
			animTree["parameters/move/blend_position"] = direction
			animTree["parameters/interact/blend_position"] = direction
	else:
		if (velocity == Vector2.ZERO):
			animTree["parameters/conditions/idle"] = true
			animTree["parameters/conditions/is_moving"] = false
		else:
			animTree["parameters/conditions/idle"] = false
			animTree["parameters/conditions/is_moving"] = true
		if (Input.is_action_pressed("Interact")):
			animTree["parameters/conditions/interact"] = true
			has_interacted = true
		else:
			animTree["parameters/conditions/interact"] = false

		if (direction != Vector2.ZERO):
			animTree["parameters/stop/blend_position"] = direction
			animTree["parameters/move/blend_position"] = direction
			animTree["parameters/interact/blend_position"] = direction
		
func update_torch():
	pass
	#if(LEFT):
		#torch.position = Vector2(0,-7)
	#if(RIGHT):
		#torch.position = Vector2(0,27)
	#if(UP):
		#torch.position = Vector2(21,13)
	#if(DOWN):
		#torch.position = Vector2(-21,13)

func player():
	pass

func collect(item):
	inv.insert(item)


func _on_sand_storm_world_wind_force(vector, wind):
	velocity = vector
	wind_force = vector
	wind_enabled = wind
	
