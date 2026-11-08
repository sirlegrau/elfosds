extends Node2D


###GETS THE CLOSEST ENEMY AVAILABLE
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
	
#GETS ROTATION AND TRANSFORMS IT TO VECTOR2
func rotation_to_direction(rotation_degrees: float) -> Vector2:
	var rotation_radians = deg_to_rad(rotation_degrees)
	var direction = Vector2(cos(rotation_radians), sin(rotation_radians))
	direction = direction.normalized()
	return direction
