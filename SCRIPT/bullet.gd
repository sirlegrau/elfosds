extends CharacterBody2D

var speed = 100;
var target_position = 50;

func _ready() -> void:
	set_velocity(target_position*speed);
	pass
	
func _physics_process(delta: float) -> void:
	var collision_info = move_and_collide(velocity*delta);
	if collision_info :
		if (collision_info.get_collider().name != "WALLS"):
			queue_free();
		else:
			velocity = velocity.bounce(collision_info.get_normal());
		
		
