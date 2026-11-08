extends CharacterBody2D


@onready var doorlabel = $"../trapdoorarea/Label"
@onready var sprite = $"Sprite2D"
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = Input.get_vector("left", "right", "up", "down") *100;
	move_and_slide()
	sprite.flip_h = EnemyUtils.flipSpriteH(velocity, sprite.flip_h)

	#look_at(get_global_mouse_position())
	pass

func _on_player_hitbox_area_entered(area: Area2D) -> void:
	#print(area.name)
	if area.name == ("area2denemy") && $hitboxCooldown.is_stopped():
		Globalctr.playerHP -= 1;
		$hitboxCooldown.start(2)
	if area.name == "trapdoorarea":
		doorlabel.visible = true
		Levelctrl.descend = true;
	pass # Replace with function body.
	
func _on_player_hitbox_area_exited(area: Area2D) -> void:
	if area.name == "trapdoorarea":
		doorlabel.visible = false
		Levelctrl.descend = false;
	pass # Replace with function body.
#GRAB EXP
func _on_grabarea_area_entered(area: Area2D) -> void:
	area.target = self
#COLLECT EXP

func _on_collectarea_area_entered(area: Area2D) -> void:
	area.collect()
	Globalctr.xmas += 1;
