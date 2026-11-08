extends Sprite2D


@onready var ballerCD = $ballerCD
@export var shootSpeed = 1
const BALL = preload("res://EQUIPMENT/ball/ball.tscn");

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_baller_cd_timeout()
	pass # Replace with function body.

func _on_baller_cd_timeout() -> void:
	ballerCD.start(shootSpeed)
	shoot()
	pass # Replace with function body.
func shoot() -> void:	
	if(EquipmentUtils.getClosestEnemy() != null):
		var newbullet = BALL.instantiate();
		newbullet.position = global_position;
		newbullet.target_position = (EquipmentUtils.getClosestEnemy().global_position - global_position).normalized();
		Globalctr.level.add_child(newbullet);
	
