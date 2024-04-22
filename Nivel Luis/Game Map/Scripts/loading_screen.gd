extends CanvasLayer

signal loading_screen_has_full_coverage

@onready var anim: AnimationPlayer = $AnimationPlayer

func _start_outro_animation() -> void:
	anim.play("end_load")
	await Signal(anim, "animation_finished")
	self.queue_free()
