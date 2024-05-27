extends Area2D
class_name InteractionArea
signal area1
@export var action_name: String = ""

var interact: Callable = func():
	pass
func _on_body_entered(body):
	InteractionManager.register_area(self)

func _on_body_exited(body):
	InteractionManager.unregister_area(self)
