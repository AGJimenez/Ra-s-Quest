extends CharacterBody2D

var speed = 40
var current_state
var direction : Vector2
var random
var dead = false
@onready var anim = $skelyboy
@onready var aura = $aura


enum enemy_states{
	IDLE,
	LEFT,
	RIGHT,
	UP,
	DOWN
}


func _process(_delta):
	if (Global.activated && !dead):
		set_physics_process(false)
		anim.play("death")
		dead = true
		aura.stop()
		aura.visible = false
	if(dead):
		pass
			
func _physics_process(_delta):
	ray_collide()
	_random()
	match current_state:
		enemy_states.IDLE:
			velocity = Vector2.ZERO
			anim.play("idle")
		enemy_states.LEFT:
			direction.x = -1
			velocity = direction * speed
			anim.play("left")
		enemy_states.RIGHT:
			direction.x = 1
			velocity = direction * speed
			anim.play("right")
		enemy_states.UP:
			direction.y = -1
			velocity = direction * speed
			anim.play("up")
		enemy_states.DOWN:
			direction.y = 1
			velocity = direction * speed
			anim.play("down")
	move_and_slide()

func _random():
	match random:
		0:
			current_state = enemy_states.DOWN
		1:
			current_state = enemy_states.UP
		2:
			current_state = enemy_states.LEFT
		3:
			current_state = enemy_states.RIGHT
		4:
			current_state = enemy_states.IDLE


func _on_timer_timeout():
	for i in $colliders.get_child_count():
		var ray = $colliders.get_child(i)
		if(!ray.is_colliding()):
			random = randi() % 5
	$Timer.start(2)

func _on_area_2d_body_entered(body):
	if(body.is_in_group("Player") && !Global.dead):
		Global.dead = true

func ray_collide():
	if($"colliders/ray(0,1)".is_colliding()):
		random = 1
	if($"colliders/ray(-1,0)".is_colliding()):
		random = 3
	if($"colliders/ray(0,-1)".is_colliding()):
		random = 0
	if($"colliders/ray(1,0)".is_colliding()):
		random = 2
		
	
