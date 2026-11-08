extends Node2D
class_name LevelHandler

const HANDLER = preload("res://ENEMY/enemy_handler.tscn")
@onready var player = $Player;
@onready var tilemap = $TileMapLayer;
@onready var trapdoor = $trapdoorarea

var enemyBatch = 1;
var newLevel = true;
var continued = false;



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	trapdoor.visible = false
	Levelctrl.nLevel= 1;
	Levelctrl.readyStart=true;
	Levelctrl.waves = 1;
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	_SELECTION()
	TRAPDOORhandler()

	pass



func TRAPDOORhandler() -> void:
	if(get_tree().get_nodes_in_group("enemy").is_empty() && Levelctrl.waves == 0):
		trapdoor.visible =true
	else:
		trapdoor.visible=false

func _SELECTION() -> void:
	if(Levelctrl.waves>0 && Levelctrl.readyStart):
		Levelctrl.obliterate=false;
		var handler = HANDLER.instantiate();
		self.add_child(handler)
		Levelctrl.readyStart = false
	elif(get_tree().get_nodes_in_group("enemy").is_empty() && Levelctrl.waves == 0):
		Levelctrl.obliterate = true;
		
