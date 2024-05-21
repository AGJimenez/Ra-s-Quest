extends CanvasLayer


func _ready() -> void:
	Save.connect("save_icon", saving)
	
func saving() -> void:
	self.visible = true
	$skeleton_saving/AnimationPlayer.play("saving")
	await $skeleton_saving/AnimationPlayer.animation_finished
	self.visible = false
