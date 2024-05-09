extends CharacterBody2D
class_name Personaje

var push_force = 120
@export var speed = 100
@onready var animTree: AnimationTree = $AnimationTree
var direction: Vector2 = Vector2.ZERO
@onready var has_interacted = false
@export var inv: Inv

var input_enabled = true

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
			velocity = direction * speed
			push_force = 120
		else:
			velocity = Vector2.ZERO
			push_force = 0
			

		move_and_slide()
		
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if(collision.get_collider() is RigidBody2D):
			collision.get_collider().apply_central_impulse(-collision.get_normal() * push_force)

func set_input_enabled(enabled):
	input_enabled = enabled

func update_animation():
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

func player():
	pass

func collect(item):
	inv.insert(item)
