extends Node2D


@onready var player = $Player;
@onready var enemyCooldown = $EnemyCooldown;
@onready var tilemap = $TileMapLayer;
@onready var sleepyTime = $SleepyTime;
var enemyBatch = 4;
var occupiedCell = PackedVector2Array();
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemyCooldown.start(1)
	sleepyTime.start(10)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	GUIhandler()
	pass


func GUIhandler() -> void:
	$Camera2D/GUI/hp.text ="HP: " + str(Globalctr.playerHP)
	$Camera2D/GUI/xmas.text = str(Globalctr.xmas)
	$Camera2D/GUI/sleep.text = str(int(sleepyTime.time_left))
	pass


func _on_sleepy_time_timeout() -> void:
	Globalctr.sleepy = true;
	pass # Replace with function body.
