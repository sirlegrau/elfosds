extends Node2D
@onready var interaction_area = $InteractionArea
@onready var gui = get_tree().get_first_node_in_group("GUI")
const inventoryUI = preload("res://utils/gui/Inventory/InventoryUI.tscn")
const wardrobeUI = preload("res://utils/gui/Wardrobe/Wardrove.tscn")


func _ready() -> void:
	interaction_area.interact = Callable(self, "_openMachine")
	
func _openMachine():

	
	
	var inventoryDisplay = inventoryUI.instantiate()
	var gui = get_tree().get_first_node_in_group("GUI")
	var wardrobeDisplay = wardrobeUI.instantiate()
	gui.add_child(inventoryDisplay);
	gui.add_child(wardrobeDisplay)
	

	
	print_debug("added a weapon")
