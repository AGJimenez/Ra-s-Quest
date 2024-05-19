extends CharacterBody2D
class_name Personaje

@export var speed = 200
@onready var animTree: AnimationTree = $AnimationTree
var direction: Vector2 = Vector2.ZERO

func _ready():
	animTree.active = true
	
func _process(delta):
	update_animation()

# MÉTODO MOVILIDAD
func _physics_process(delta):
	direction = Input.get_vector("Left", "Right", "Up", "Down").normalized()
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()
	
func update_animation():
	if (velocity == Vector2.ZERO):
		animTree["parameters/conditions/idle"] = true
		animTree["parameters/conditions/is_moving"] = false
	else:
		animTree["parameters/conditions/idle"] = false
		animTree["parameters/conditions/is_moving"] = true
	if (Input.is_action_pressed("Interact")):
		animTree["parameters/conditions/interact"] = true
	else:
		animTree["parameters/conditions/interact"] = false
	
	if (direction != Vector2.ZERO):
		animTree["parameters/stop/blend_position"] = direction
		animTree["parameters/move/blend_position"] = direction
		animTree["parameters/interact/blend_position"] = direction
