extends CharacterBody2D

var speed = 100;
var target_position = 50;
var damage = 1
var knockback = 100
var bounces =0

var target = Vector2.ZERO
var angle = Vector2.ZERO

func _ready() -> void:
	
	angle= global_position.direction_to(EquipmentUtils.getClosestEnemy().global_position)
	rotation = angle.angle() + deg_to_rad(135)
	pass
	
func _physics_process(delta: float) -> void:
	position += angle*speed*delta
	var collision_info = move_and_collide(velocity*delta);
	if collision_info :
		angle = angle.bounce(collision_info.get_normal());
		checkBounces()


func _on_bullet_hurtbox_body_entered(body: Node2D) -> void:
	if(body.is_in_group("enemy")):
		if(angle == null):
			angle = Vector2.ZERO
		body.take_damage(damage, angle, knockback)
	pass 
	
func checkBounces():
	bounces -= 1;
	if bounces < 0:
		queue_free()
