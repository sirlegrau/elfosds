extends Node

@onready var world = $"../World";
@onready var player = $"../World/LEVEL/Player";
@onready var level = $"../World/level"
@onready var home = $"../World/Home"

var sleepyTime = 15;
@onready var sleepyTimer = $"../World/SleepyTime"

var newlevel = preload("res://SCENE/level.tscn")
var nhome = preload("res://SCENE/home.tscn")

## GLOBAL 🌍🌍 VARIABLES ##
var xmas = 0;
var canEnter = false;

## LEVEL 🔫🔫 VARIABLES ##
var playerHP = 3;
var levelSpeed = 0.03;
var sleepy = false;

func _ready() 	-> void:
	#home.queue_free()
	pass
	
func _process(delta: float) -> void:
	if not (sleepyTimer.is_stopped()):
		sleepyTime = sleepyTimer.time_left
	else:
		sleepyTime = 15
	_stopGame()

func _startGame():
	home.queue_free();
	var new = newlevel.instantiate();
	world.add_child(new)
	level = $"../World/LEVEL"
	player = $"../World/Player";
	sleepy = false
	sleepyTimer.start(sleepyTime)
	
func _stopGame():
	if sleepy == true || playerHP <= 0:
		level = $LEVEL
		if is_instance_valid(level):
			level.queue_free()
			var newhome = nhome.instantiate();
			world.add_child(newhome);
			home = $"../World/home"
			playerHP = 3;
			sleepy = false
			


func _on_sleepy_time_timeout() -> void:
	print_debug("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAASFDGASDFGASDGASD")
	sleepy = true
