extends Camera2D
@onready var lock = $"../cursed_lock"
@onready var key = $"../master_cursed_key"
@onready var distance_key = key.position.x

var shake_off = false

@export var random_strength: float = 0.2
@export var shake_fade: float = 10.0

var rng = RandomNumberGenerator.new()

var shake_strength: float = 0.0

func apply_shake():
	shake_strength = random_strength
	
func _process(delta):
	if(!shake_off):
		var distance = key.global_position.distance_to(lock.global_position)
		
		random_strength = (distance + (distance_key + 50)) / 100
		if(random_strength > 0):
			random_strength = 0
		apply_shake()
		
		if(shake_strength > 0):
			shake_strength = lerpf(shake_strength, 0 ,shake_fade * delta)
		offset = random_offset()
			
func random_offset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))


func _on_cursed_lock_unlock():
	shake_off = true
