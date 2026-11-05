extends Node

@onready var world = $"../World";
@onready var player = $"../World/Player";
@onready var level = $"../World/LEVEL"
@onready var home = $"../World/Home"
@onready var debug = $"../World/secdebug"


var nhome = preload("res://SCENE/home.tscn")

## GLOBAL 🌍🌍 VARIABLES ##
var xmas = 0;
var canEnter = false;

## LEVEL 🔫🔫 VARIABLES ##
var CAMERAPOSy = null;
var playerHP = 3;
var levelSpeed = 0.03;


func _ready() 	-> void:
	#home.queue_free()
	pass
	
func _process(delta: float) -> void:
	if get_tree().get_nodes_in_group("enemy").size() == 0 and is_instance_valid(level):
		levelSpeed = levelSpeed *1.1;
	if CAMERAPOSy != null:
		levelSpeed = 0.03 + (float(CAMERAPOSy)/-300)
	
	
func checkEnemy() -> void:
	pass
