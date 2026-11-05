extends CharacterBody2D


# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = Input.get_vector("left", "right", "up", "down") *100;
	move_and_slide()
	
	#look_at(get_global_mouse_position())
	pass
	

#GRAB EXP
func _on_grabarea_area_entered(area: Area2D) -> void:
	area.target = self
#COLLECT EXP
