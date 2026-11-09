extends Node

@onready var world = $"../World";
@onready var player = $"../World/LEVEL/Player";
@onready var level = $"../World/level"
@onready var home = $"../World/home"


var initialSleepyTime= Datactrl.sleepyTime
var sleepyTime = Datactrl.sleepyTime;
@onready var sleepyTimer = $"../World/SleepyTime"

var newlevel = preload("res://SCENE/level.tscn")
var nhome = preload("res://SCENE/home.tscn")

## GLOBAL 🌍🌍 VARIABLES ##
var canEnter = false;

## LEVEL 🔫🔫 VARIABLES ##
var sleepy = false;

func _ready() 	-> void:
	#home.queue_free()
	pass
	
func _process(delta: float) -> void:
	if not (sleepyTimer.is_stopped()):
		sleepyTime = sleepyTimer.time_left
	else:
		sleepyTime = initialSleepyTime
	_stopGame()

func _startGame():
	home = $"../World/home"
	home.queue_free();

	Levelctrl.descend= false
	Levelctrl.nLevel=0;
	var new = newlevel.instantiate();
	world.add_child(new)
	level = $"../World/LEVEL"
	player = $"../World/Player";
	sleepy = false
	sleepyTimer.start(sleepyTime)
	
func _stopGame():
	if sleepy == true || Datactrl.playerHP <= 0:
		Datactrl.playerHP = 3;
		level = $"../World/LEVEL"
		if is_instance_valid(level):
			level.queue_free()
			var newhome = nhome.instantiate();
			world.add_child(newhome);
			home = $"../World/home"
			sleepy = false
		sleepyTimer.stop()
		for loot in Datactrl.loot:
			var n = Datactrl.loot[loot]
			print(str(loot)  + "   " +  str(n))

func _on_sleepy_time_timeout() -> void:
	sleepy = true
	
	
func _update_Inventory():
	pass
