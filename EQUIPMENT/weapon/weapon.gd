extends Sprite2D


@onready var CD = $weaponCD
@onready var animator = $AnimationPlayer
var slash_time = 0.2
var damage = 1
var knockback = 90;
var angle = Vector2.ZERO;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var closest_enemy = getClosestEnemy()
	#if closest_enemy:
		#self.look_at(closest_enemy.position)
		#self.look_at(get_global_mouse_position())
	
	if(CD.is_stopped()):
		
		var tween = get_tree().create_tween()
		tween.tween_property(self, "rotation",deg_to_rad(self.rotation)+deg_to_rad(360), 2.3).from(0)
	
		#if closest_enemy:
		CD.start(2.3)
	
	scale.x = 2.3
	scale.y = 2.3
	
func getClosestEnemy() -> CharacterBody2D:
	var enemies = get_tree().get_nodes_in_group("enemy")
	if enemies.size() == 0:
		return null
	var closest: Node2D = null
	var shortest_distance: float = INF 
	for enemy in enemies:
		if enemy is Node2D:
			# Use distance_squared_to as it avoids heavy square root calculations
			var distance = global_position.distance_squared_to(enemy.global_position)
			if distance < shortest_distance:
				shortest_distance = distance
				closest = enemy
				
	return closest

func _on_weapon_hurtbox_body_entered(body: Node2D) -> void:
	print_debug(rotation)
	var angle = rotation_to_direction(rad_to_deg(rotation))
	
	if(body.is_in_group("enemy")):
		if(angle == null):
			angle = Vector2.ZERO
		print_debug(angle)
		body.take_damage(damage, angle, knockback)
	pass # Replace with function body.
	
func rotation_to_direction(rotation_degrees: float) -> Vector2:
	var rotation_radians = deg_to_rad(rotation_degrees)
	var direction = Vector2(cos(rotation_radians), sin(rotation_radians))
	direction = direction.normalized()
	return direction
