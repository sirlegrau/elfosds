extends Node2D
class_name LevelHandler

const HANDLER = preload("res://ENEMY/enemy_handler.tscn")
@onready var player = $Player;
@onready var enemyCooldown = $EnemyCooldown;
@onready var tilemap = $TileMapLayer;
@onready var sleepyTime = $SleepyTime;
@onready var trapdoor = $trapdoorarea

var enemyBatch = 1;
var newLevel = true;
var continued = false;



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	trapdoor.visible = false
	sleepyTime.start(30)
	Levelctrl.nLevel= 1;
	Levelctrl.readyStart=true;
	Levelctrl.waves = 1;
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	GUIhandler()
	_SELECTION()
	TRAPDOORhandler()

	pass

func GUIhandler() -> void:
	$Camera2D/GUI/hp.text ="HP: " + str(Globalctr.playerHP)
	$Camera2D/GUI/xmas.text = str(Globalctr.xmas)
	$Camera2D/GUI/sleep.text = str(int(sleepyTime.time_left))
	pass

func TRAPDOORhandler() -> void:
	if(get_tree().get_nodes_in_group("enemy").is_empty() && Levelctrl.waves == 0):
		trapdoor.visible =true
	else:
		trapdoor.visible=false

func _SELECTION() -> void:
	print_debug(str(Levelctrl.readyStart) + "======" + str(Levelctrl.waves))
	if(Levelctrl.waves>0 && Levelctrl.readyStart):
		Levelctrl.obliterate=false;
		var handler = HANDLER.instantiate();
		self.add_child(handler)
		Levelctrl.readyStart = false
		print_debug("new LEVEL" + str(Levelctrl.nLevel))
	elif(get_tree().get_nodes_in_group("enemy").is_empty() && Levelctrl.waves == 0):
		Levelctrl.obliterate = true;
		

func _on_sleepy_time_timeout() -> void:
	Globalctr.sleepy = true;
	pass # Replace with function body.
