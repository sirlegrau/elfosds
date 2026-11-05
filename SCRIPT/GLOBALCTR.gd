extends Node

@onready var world = $"../World";
@onready var player = $"../World/level/Player";
@onready var level = $"../World/level"
@onready var home = $"../World/Home"

var newlevel = preload("res://SCENE/level.tscn")
var nhome = preload("res://SCENE/home.tscn")

## GLOBAL 🌍🌍 VARIABLES ##
var xmas = 0;
var canEnter = false;

## LEVEL 🔫🔫 VARIABLES ##
var CAMERAPOSy = null;
var playerHP = 3;
var levelSpeed = 0.03;
var sleepy = false;

func _ready() 	-> void:
	#home.queue_free()
	pass
	
func _process(delta: float) -> void:
	if get_tree().get_nodes_in_group("enemy").size() == 0 and is_instance_valid(level):
		levelSpeed = levelSpeed *1.1;
	if CAMERAPOSy != null:
		levelSpeed = 0.03 + (float(CAMERAPOSy)/-300)

	if Input.get_action_strength("interact") && canEnter:
		home.queue_free();
		var new = newlevel.instantiate();
		world.add_child(new)
		level = $"../World/LEVEL"
		player = $"../World/Player";
		sleepy = false
	if sleepy == true || playerHP <= 0:
		if is_instance_valid(level):
			level.queue_free()
			var newhome = nhome.instantiate();
			world.add_child(newhome);
			home = $"../World/home"
			playerHP = 3;
	
func checkEnemy() -> void:
	pass
