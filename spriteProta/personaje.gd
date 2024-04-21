extends CharacterBody2D
class_name Personaje

var speed = 120
var direccion = Vector2.ZERO
var lastDirection = ""
@onready var anim = $AnimatedSprite2D

# MÉTODO ASIGNACIÓN DIRECCIONES
func _physics_process(delta):
	direccion = Vector2.ZERO

	if Input.is_action_pressed("Left"):
		direccion.x -= 1
		lastDirection = "Left"
	if Input.is_action_pressed("Right"):
		direccion.x += 1
		lastDirection = "Right"
	if Input.is_action_pressed("Up"):
		direccion.y -= 1
		lastDirection = "Up"
	if Input.is_action_pressed("Down"):
		direccion.y += 1
		lastDirection = "Down"

	velocity = direccion * speed

	update_animation()
	move_and_slide()

# MÉTODO MOVIMIENTO
func update_animation():
	if direccion != Vector2.ZERO:
		anim.play("move" + lastDirection)
	else:
		anim.play("stop" + lastDirection)
