extends Node

signal inventory_updated

@onready var inventory_slot_scene = preload("res://utils/gui/Inventory/InventorySlot.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Datactrl.inventory.resize(16)
	print(Datactrl.inventory)
	pass # Replace with function body.


###ADDS AN ITEM TO INVENTORY RETURN TRUE IF SUCCESS
func add_item(item: Item):
	for i in range(Datactrl.inventory.size()):
		if Datactrl.inventory[i] == null:
			Datactrl.inventory[i] = item
			inventory_updated.emit()
			print(Datactrl.inventory)
			return
		else:
			pass
	
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
