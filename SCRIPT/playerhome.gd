extends CharacterBody2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = Input.get_axis("left", "right")*150;
	# Handle jump.
	move_and_slide()
