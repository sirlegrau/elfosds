extends Node2D
@onready var interaction_area = $InteractionArea
@onready var gui = get_tree().get_first_node_in_group("GUI")
const inventoryUI = preload("res://utils/gui/InventoryUI.tscn")
var item = load("res://EQUIPMENT/_ITEMS/baller.tres")

func _ready() -> void:
	interaction_area.interact = Callable(self, "_openMachine")
	
func _openMachine():

	Inventoryctrl.add_item(item)
	var inventoryDisplay = inventoryUI.instantiate()
	var gui = get_tree().get_first_node_in_group("GUI")
	gui.add_child(inventoryDisplay);
	
	print_debug("added a weapon")
