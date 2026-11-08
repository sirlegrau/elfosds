extends Area2D

var target = null
var speed = -0
@onready var collision = $collision;
@onready var sprite2d = $Sprite2D
@export var sprite:Texture
var type : String

func _ready():
	sprite2d.texture = sprite
	
func _physics_process(delta: float) -> void:
	if target != null:
		global_position = global_position.move_toward(target.global_position, speed)
		speed += 2*delta
func collect():
	print("collected    " + str(type))
	collision.call_deferred("set", "disabled", true)
	queue_free()
