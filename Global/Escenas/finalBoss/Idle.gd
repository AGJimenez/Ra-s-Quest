extends State
 
@onready var collision = $"../../PlayerDetection/CollisionShape2D"
@onready var progress_bar = $"../../UI/ProgressBar"
 
var player_entered: bool = false:
	set(value):
		player_entered = value
		collision.set_deferred("disabled", value)
		progress_bar.set_deferred("visible",value)
 
 
func _on_player_entered(_body):
	if _body.name == "ship":
		player_entered = true
 
 
func transition():
	if player_entered:
		get_parent().change_state("Summon")
