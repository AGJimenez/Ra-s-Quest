extends CharacterBody2D

const SPEED = 100
var currentDirection = "none"
var lastDirection ="none"


func _physics_process(delta):
	movimiento(delta)

func movimiento(delta):
	if Input.is_action_pressed("Left"):
		currentDirection = "Left"
		#print(currentDirection)
		#animacion()
		velocity.x = -SPEED
		velocity.y = 0
	elif Input.is_action_pressed("Right"):
		currentDirection = "Right"
		#print(currentDirection)
		#animacion()
		velocity.x = SPEED
		velocity.y = 0
	elif Input.is_action_pressed("Up"):
		currentDirection = "Up"
		#print(currentDirection)
		#animacion()
		velocity.y = -SPEED
		velocity.x = 0
	elif Input.is_action_pressed("Down"):
		currentDirection = "Down"
		#print(currentDirection)
		#animacion()
		velocity.y = SPEED
		velocity.x = 0
	else:
		currentDirection="none"
		#animacion()
		velocity.y = 0
		velocity.x = 0
	
	if currentDirection!="none":
		lastDirection=currentDirection
	else:
		lastDirection=lastDirection
	move_and_slide()
	

func animacion():
	var dir=currentDirection
	var last=lastDirection
	var anim=$AnimatedSprite2D
	if dir=="Right":
		anim.flip_h=false
		anim.play("mov_derecha")
	elif dir=="Left":
		anim.flip_h=true
		anim.play("mov_derecha")
	elif dir=="Down":
		anim.play("mov_abajo")
	elif dir=="Up":
		anim.play("mov_arriba")
	else:
		if last=="Right":
			anim.flip_h=false
			anim.play("default_derecha")
		elif lastDirection=="Left":
			anim.flip_h=true
			anim.play("default_derecha")
		elif lastDirection=="Up":
			anim.play("default_back")
		else:
			anim.play("default")
