extends Node2D

const ENEMY = preload("res://SCENE/enemy.tscn");
@onready var player = $Player;
@onready var enemyCooldown = $EnemyCooldown;
@onready var tilemap = $TileMapLayer;
@onready var sleepyTime = $SleepyTime;
var enemyBatch = 2;
var occupiedCell = PackedVector2Array();
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemyCooldown.start(1)
	sleepyTime.start(15)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	GUIhandler()
	pass

func getEnemyCoords() -> int:
	var rng = RandomNumberGenerator.new();
	var random = rng.randf_range(-8,8);
		
	return int(random);

func createEnemy() -> void:
	
	var enemy = ENEMY.instantiate();
	enemy.position = tilemap.map_to_local(Vector2(getEnemyCoords(), getEnemyCoords()))
	enemy.add_to_group("enemy");
	Globalctr.level.add_child(enemy);


func _on_enemy_cooldown_timeout() -> void:
	for n in (enemyBatch):
		createEnemy();
	enemyCooldown.start(6);
	pass # Replace with function body.



func GUIhandler() -> void:
	$Camera2D/GUI/hp.text ="HP: " + str(Globalctr.playerHP)
	$Camera2D/GUI/xmas.text = str(Globalctr.xmas)
	$Camera2D/GUI/sleep.text = str(int(sleepyTime.time_left))
	pass


func _on_sleepy_time_timeout() -> void:
	Globalctr.sleepy = true;
	pass # Replace with function body.
