extends CharacterBody2D

@onready var sprite = $Sprite2D
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = Input.get_axis("left", "right")*150;
	sprite.flip_h = EnemyUtils.flipSpriteH(velocity, sprite.flip_h)
	# Handle jump.
	move_and_slide()
	
	
	
