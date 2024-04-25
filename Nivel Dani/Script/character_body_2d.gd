extends CharacterBody2D

const SPEED = 100
var currentDirection = "none"
var lastDirection ="none"
var on_area_cofre=false
var on_area_balanza=false

func _physics_process(delta):
	movimiento(delta)
	if on_area_cofre ==true and Input.is_action_just_pressed("Interactuar"):
		interaccion_con_cofre()
	#elif on_area_balanza==true and Input.is_action_just_pressed("Interactuar"):
		#interaccion_con_balanza()

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

func interaccion_con_cofre():
	var panel_visible : Panel = $Camera2D/Panel
	if panel_visible.visible:
		panel_visible.visible = false
	else:
		panel_visible.visible = true
		#DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/panel_respuesta.dialogue"),"main")
		


#func interaccion_con_balanza():
	#DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/interaccion_con_balanza.dialogue"),"main")

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

func _on_area_cofres_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_2_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_2_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_3_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_3_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_4_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_4_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_5_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_5_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_6_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_6_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_balanza_maat_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_balanza=true
func _on_balanza_maat_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_balanza=false
func _on_area_cofres_vertical_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_vertical_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_vertical_2_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_vertical_2_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_vertical_3_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_vertical_3_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_vertical_4_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_vertical_4_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_vertical_5_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_vertical_5_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_vertical_6_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_vertical_6_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_vertical_7_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_vertical_7_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
func _on_area_cofres_vertical_8_body_entered(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=true
func _on_area_cofres_vertical_8_body_exited(body):
	if body.name=="CharacterBody2D":
		on_area_cofre=false
