extends Node

@onready var world = $"../World";
@onready var player = $"../World/LEVEL/Player";
@onready var level = $"../World/level"
@onready var home = $"../World/home"


var initialSleepyTime=15
var sleepyTime = 15;
@onready var sleepyTimer = $"../World/SleepyTime"

var newlevel = preload("res://SCENE/level.tscn")
var nhome = preload("res://SCENE/home.tscn")

## GLOBAL 🌍🌍 VARIABLES ##
var canEnter = false;

## LEVEL 🔫🔫 VARIABLES ##
var playerHP = 3;
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
	if sleepy == true || playerHP <= 0:
		print("ESTOY AQUI PLAYER HP SHOULD BE 3")
		Globalctr.playerHP = 3;
		print(playerHP)
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
	print_debug("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAASFDGASDFGASDGASD")
	sleepy = true
