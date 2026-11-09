extends Node

#VARIABLES THAT CHECK IF A ROOM IS CLEARED AND TRIGGERS STUFF
var descend = false;
var waves=5;
var obliterate = false;

#SETS THE ROOM LEVEL
var nLevel = 0;
#CHECK IF A ROOM HAS ALREADY STARTED AND PREVENTS DUPLICATES
var readyStart=true;



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.get_action_strength("interact") && descend:
		var lootables = get_tree().get_nodes_in_group("loot")
		for loot in lootables:
			loot.remove_from_group("loot")
			loot.queue_free()
		
		nLevel+=1;
		waves= nLevel+3;
		descend = false;
		readyStart=true;
		print_debug(nLevel)
	pass
