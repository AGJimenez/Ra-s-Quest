extends CharacterBody2D
var on_area_ojo = false
var speed = 100
var player_state


@export var inv: Inv

func _physics_process(delta):
	if on_area_ojo ==true and Input.is_action_just_pressed("Interactuar"):
		print("aña")
		showProblem()


	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.length() == 0:
		player_state = "idle"
	else:
		player_state = "walking"
	
	velocity = direction.normalized() * speed
	move_and_slide()
	playAnim(direction)

func showProblem():
	DialogueManager.show_dialogue_balloon(load("res://dialog/LeerJero.dialogue"),"start")


func playAnim(dir):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	elif player_state == "walking":
		if dir.y == -1:
			$AnimatedSprite2D.play("walk-b")
		elif dir.x == 1:
			$AnimatedSprite2D.play("walk-r")
		elif dir.y == 1:
			$AnimatedSprite2D.play("walk-f")
		elif dir.x == -1:
			$AnimatedSprite2D.play("walk-l")

func player():
	pass

func collect(item):
	inv.insert(item)

func _on_area_2d_body_entered(body):
	if body.name=="player":
		on_area_ojo=true
		$Control.visible = true
		print(on_area_ojo)

func _on_area_2d_body_exited(body):
	if body.name=="player":
		on_area_ojo=false
		$Control.visible = false
		print(on_area_ojo)
