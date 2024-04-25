extends CharacterBody2D

var speed = 100
var player_state
@export var inv: Inv

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.length() == 0:
		player_state = "idle"
	else:
		player_state = "walking"
	
	velocity = direction.normalized() * speed
	move_and_slide()
	playAnim(direction)

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
