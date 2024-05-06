extends Sprite2D

var timer = true
var shake_off = false
@export var random_strength: float = 2.0
@export var shake_fade: float = 2.0

var rng = RandomNumberGenerator.new()

var shake_strength: float = 0.0

func apply_shake():
	shake_strength = random_strength
	
func _process(delta):
	if(Global.pressed):
		if(timer):
			$Timer.start(0.2)
			timer = false
		apply_shake()
		if(shake_strength > 0):
			shake_strength = lerpf(shake_strength, 0 ,shake_fade * delta)
			offset = random_offset()
			
func random_offset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))

func _on_timer_timeout():
	Global.pressed = false
	timer = true
	self.offset = Vector2(0,0)
