### THIS CLASS HAS GLOBAL METHODS FOR ENEMY CHARACTERBODIES
###
### EDITS HERE WILL AFFECT TO EVERY ENEMY
extends Node

###GLOBAL DEATH METHOD
### EXPERIENCE ITEM LOOT ITEM, CHANCEPERCENTAGE INT, POSITION VECTOR2
func death(experience:Item, loot:Item, dropChancePercent:int, position:Vector2):
	var drop:Item = getLootType(experience, loot, dropChancePercent)
	var dropInstance = drop.scene.instantiate()
	dropInstance.position = position;
	dropInstance.sprite = drop.texture
	dropInstance.type = drop.name
	Globalctr.level.add_child(dropInstance);
	dropInstance.add_to_group("loot")
	self.remove_from_group("enemy")

	return
	
func getLootType(experience:Item, loot:Item, dropChancePercent:int) -> Item:
	var rng = RandomNumberGenerator.new()
	var chance = int(rng.randf_range(0, 100))
	print_debug(chance)
	if chance<=dropChancePercent:
		return loot
	else:
		return experience
	
func flipSpriteH(direction :Vector2, current:bool) -> bool:
	if direction.x > 0.2:
		return true
	elif direction.x < -0.2:
		return  false
	else: 
		return current
