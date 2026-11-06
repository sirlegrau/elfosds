extends CharacterBody2D

const BULLET = preload("res://SCENE/bullet.tscn");

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = Input.get_vector("left", "right", "up", "down") *100;
	move_and_slide()
	
	#look_at(get_global_mouse_position())
	pass
	
func _on_player_hitbox_area_entered(area: Area2D) -> void:
	#print(area.name)
	if area.name == ("area2denemy") && $hitboxCooldown.is_stopped():
		Globalctr.playerHP -= 1;
		$hitboxCooldown.start(3)
	pass # Replace with function body.

#GRAB EXP
func _on_grabarea_area_entered(area: Area2D) -> void:
	area.target = self
#COLLECT EXP

func _on_collectarea_area_entered(area: Area2D) -> void:
	area.collect()
	Globalctr.xmas += 1;

# Shoot function: reemplazar con modulos, solo nos interesa como mueren los enemigos
func _on_ostias_timeout() -> void:
	var newbullet = BULLET.instantiate();
	newbullet.position = global_position;
	newbullet.target_position = (get_global_mouse_position() - global_position).normalized();
	Globalctr.level.add_child(newbullet);
	$shootCooldown.start(0.09);
	pass # Replace with function body.
