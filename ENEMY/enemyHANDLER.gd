extends Node2D
@onready var tilemap = $"../TileMapLayer";
#TIMERS 
@onready var soulTimer = $soulTimer;
@onready var beeTimer = $beeTimer;
@onready var wormTimer = $wormTimer;

#ENEMY SCENE PRELOADS
const SOUL = preload("res://ENEMY/soul/soul.tscn")
const BEE = preload("res://ENEMY/bee/bee.tscn")
const WORM = preload("res://ENEMY/worm/worm.tscn")

#RELATIVE TO -- SOUL -- 
var soulWaves = 0;
var soulCD = 6;

#RELATIVE TO -- BEE --
var beeWaves = 0;
var beeCD = 10;

#RELATIVE TO -- WORM --
var wormWaves = 0;
var wormCD = 2;



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#DEFINE WAVE SIZES
	match Levelctrl.nLevel:
		1:
			soulWaves = 1;
			wormWaves= 15
		2:
			soulWaves =2
			wormWaves =2;
		3:
			beeWaves = 5;
	
	Levelctrl.waves = soulWaves+beeWaves+wormWaves;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	WAVEhandler()
	shouldIDie()
	pass
	

func WAVEhandler() ->void:
		#CHECKS IF CAN SPAWN NEW WAVES WITH TIMERS
	if(soulTimer.is_stopped() && soulWaves >0):
		soulWaves = spawnWithTimer(soulTimer, soulWaves, soulCD, SOUL)
	if(beeTimer.is_stopped() && beeWaves >0):
		beeWaves = spawnWithTimer(beeTimer, beeWaves, beeCD, BEE)
	if(wormTimer.is_stopped() && wormWaves >0):
		wormWaves = spawnWithTimer(wormTimer, wormWaves, wormCD, WORM)
		#CHEKS IF ROOM IS CLEAR -- IF WAVES REMAINING IT WILL SPAWN ONE OF EACH
	elif(get_tree().get_nodes_in_group("enemy").is_empty()):
		if(soulWaves>0):
			soulWaves = spawnWithOutTimer(soulWaves, soulCD, SOUL)
		if(beeWaves>0):
			beeWaves = spawnWithOutTimer(beeWaves, beeCD, BEE)
		if(soulWaves>0):
			wormWaves = spawnWithOutTimer(wormWaves, wormCD, WORM)
			
	#USED BY CONTROLLED TO CHECK IF A ROOM IS CLEARED
	Levelctrl.waves = soulWaves+beeWaves+wormWaves;

func spawnWithOutTimer (waves: int, waveCooldown: int, type:PackedScene) -> int:
	createEnemy(type)
	waves -=1
	return waves
func spawnWithTimer(cooldown: Timer, waves: int, waveCooldown: int, type:PackedScene) -> int:
	createEnemy(type)
	cooldown.start(waveCooldown)
	waves -=1
	return waves
	
func getEnemyCoords() -> int:
	var rng = RandomNumberGenerator.new();
	var random = rng.randf_range(-8,8);
	return int(random);

func createEnemy(enemyType: PackedScene) -> void:
	var enemy = enemyType.instantiate();
	enemy.position = tilemap.map_to_local(Vector2(getEnemyCoords(), getEnemyCoords()))
	enemy.add_to_group("enemy");
	Globalctr.level.add_child(enemy);
	
	
	#IF ROOM IS CLEARED ENEMYHANDLER IS DELETED
func shouldIDie() ->void:
	if(Levelctrl.obliterate):
		self.queue_free();
