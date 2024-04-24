extends CharacterBody2D

var speed = 200
var direction: Vector2

		
func _physics_process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction
	if direction == Vector2.ZERO:
		velocity = Vector2.ZERO
		
	else:
		direction = direction.normalized()  # Normalize direction vector
		velocity = direction * speed
		
	move_and_slide()
	
	
