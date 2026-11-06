extends Node2D
class_name LevelHandler


const SOUL = preload("res://ENEMY/soul/soul.tscn")
const BEE = preload("res://ENEMY/bee/bee.tscn")
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
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	GUIhandler()
	WAVEhandler()
	TRAPDOORhandler()
	pass

func getEnemyCoords() -> int:
	var rng = RandomNumberGenerator.new();
	var random = rng.randf_range(-8,8);
	return int(random);

func createEnemy(enemyType: PackedScene) -> void:
	var enemy = enemyType.instantiate();
	enemy.position = tilemap.map_to_local(Vector2(getEnemyCoords(), getEnemyCoords()))
	enemy.add_to_group("enemy");
	Globalctr.level.add_child(enemy);


func _on_enemy_cooldown_timeout() -> void:
	pass # Replace with function body.


func GUIhandler() -> void:
	$Camera2D/GUI/hp.text ="HP: " + str(Globalctr.playerHP)
	$Camera2D/GUI/xmas.text = str(Globalctr.xmas)
	$Camera2D/GUI/sleep.text = str(int(sleepyTime.time_left))
	pass
func WAVEhandler() ->void:
	match Levelctrl.nLevel:
		1:
			if(enemyCooldown.is_stopped() && Levelctrl.waves >0):
				createEnemy(SOUL)
				enemyCooldown.start(6)
				Levelctrl.waves -=1;
			elif(get_tree().get_nodes_in_group("enemy").is_empty() && Levelctrl.waves > 3):
				createEnemy(BEE)
				createEnemy(BEE)
				createEnemy(BEE)
				Levelctrl.waves -=3;
		2:	
			if(enemyCooldown.is_stopped() && Levelctrl.waves >0):
				createEnemy(SOUL)
				enemyCooldown.start(6)
				Levelctrl.waves -=1;
			if(get_tree().get_nodes_in_group("enemy").is_empty() && Levelctrl.waves > 0):
				_on_enemy_cooldown_timeout()
				Levelctrl.waves -=1;
			
			
func TRAPDOORhandler() -> void:
	if(get_tree().get_nodes_in_group("enemy").is_empty() && Levelctrl.waves == 0):
		trapdoor.visible =true
	else:
		trapdoor.visible=false




func _on_sleepy_time_timeout() -> void:
	Globalctr.sleepy = true;
	pass # Replace with function body.
