extends Node

signal inventory_updated


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Datactrl.inventory.resize(16)
	pass # Replace with function body.


###ADDS AN ITEM TO INVENTORY RETURN TRUE IF SUCCESS
func add_item(item: Item):
	print("size")
	print(Datactrl.inventory.size())
	for i in range(Datactrl.inventory.size()):
		if Datactrl.inventory[i] == null:
			Datactrl.inventory[i] = item
			inventory_updated.emit()
			print("added")
			print_debug(item)
			return true
		else:
			print("trying to add")
			pass
		print("not added")
	return false
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
