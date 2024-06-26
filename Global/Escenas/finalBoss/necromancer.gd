extends CharacterBody2D
 
@onready var player = get_parent().find_child("ship")
@onready var sprite = $Sprite2D
@onready var progress_bar = $UI/ProgressBar
 
var direction : Vector2
 
var health = 1000:
	set(value):
		if value < health:
			find_child("FiniteStateMachine").change_state("Stagger")
 
		health = value
		progress_bar.value = value
 
		if value <= 0:
			progress_bar.visible = false
			find_child("FiniteStateMachine").change_state("Death")
 
 
func _process(_delta):
	direction = player.position - position
 
	if direction.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
 
func take_damage():
	health -= 5
