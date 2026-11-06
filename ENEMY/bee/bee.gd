extends CharacterBody2D

const EXP = preload("res://SCENE/exp.tscn");

var totalHP = 1;	
var hp = totalHP;
@export var knockback_recovery = 3.5
var knockback = Vector2.ZERO
@export var movementSpeed = 30
@onready var sprite = $Sprite2D

@onready var player = get_tree().get_first_node_in_group("Player")

func _ready() -> void:

	pass
func _physics_process(delta: float) -> void:
	knockback = knockback.move_toward(Vector2.ZERO, knockback_recovery)
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*movementSpeed
	velocity += knockback
	move_and_slide()	
	if direction.x > 0.2:
		sprite.flip_h = true
	elif direction.x < -0.2:
		sprite.flip_h = false
	if hp <= 0 :
		var exp = EXP.instantiate();
		exp.position = position;
		Globalctr.level.add_child(exp);
		self.remove_from_group("enemy")
		free();
		return



func _on_area_2d_area_entered(area: Area2D) -> void:
	if String(area.name) == ("bullet_hurtbox"):
		hp -= 3;
	#print(area.name)
	pass # Replace with function body.
