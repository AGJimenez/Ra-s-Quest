extends CharacterBody2D
class_name Personaje

var speed = 120
var direccion = Vector2(0,0)
@onready var anim = $AnimatedSprite2D

# METODO PARA MOVIMIENTO
func _physics_process(delta):
	direccion = Vector2.ZERO
		
	if Input.is_action_pressed("Left"):
		direccion.x += -1
	if Input.is_action_pressed("Right"):
		direccion.x += 1
	if Input.is_action_pressed("Up"):
		direccion.y += -1
	if Input.is_action_pressed("Down"):
		direccion.y += 1
		
	velocity = direccion * speed
	move_and_slide()
	animations()

# METODO PARA ASIGNAR ANIMACION CORRESPONDIENTE
func animations():
	if (velocity != Vector2.ZERO):
		if (velocity.x > 0):
			anim.play("moveRight");
		elif (velocity.x < 0):
			anim.play("moveLeft");
		elif (velocity.y > 0):
			anim.play("moveDown");
		elif (velocity.y < 0):
			anim.play("moveUp");
	else:
		anim.play("idle");
