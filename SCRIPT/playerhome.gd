extends CharacterBody2D

@onready var doorlabel = $"../door1/door1Label"


func _ready() -> void:
	doorlabel.visible = false
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = Input.get_axis("left", "right")*150;
	# Handle jump.
	move_and_slide()
	
	


func _on_playerhomearea_area_entered(area: Area2D) -> void:
	if area.name == "door1":
		doorlabel.visible = true
		Globalctr.canEnter = true;
	pass # Replace with function body.

func _on_playerhomearea_area_exited(area: Area2D) -> void:
	if area.name == "door1":
		doorlabel.visible = false
		Globalctr.canEnter = false;
	pass # Replace with function body.
