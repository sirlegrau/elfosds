extends CharacterBody2D


@export var loot:Item
@export var experience:Item
@export var totalHP = 1;
var hp = totalHP;
@export var dropChancePercent=15;
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
	sprite.flip_h = EnemyUtils.flipSpriteH(direction, sprite.flip_h)

	if hp <= 0:
		EnemyUtils.death(experience, loot, dropChancePercent, position)
		queue_free()
	else:
		pass


func take_damage(damage, angle, knockback_amount):
	hp -= damage
	knockback = angle * knockback_amount
