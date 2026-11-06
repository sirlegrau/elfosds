extends Area2D

var target = null
var speed = -0
@onready var collision = $collision;
func _physics_process(delta: float) -> void:
	if target != null:
		global_position = global_position.move_toward(target.global_position, speed)
		speed += 2*delta


func collect():
	print("collected")
	collision.call_deferred("set", "disabled", true)
	queue_free()
