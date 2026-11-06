extends Node


var descend = false;
var nLevel = 0;
var waves=5;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.get_action_strength("interact") && descend:
		nLevel+=1;
		waves= nLevel+3;
		descend = false;
		print_debug(nLevel)
	pass
