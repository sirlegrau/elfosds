extends Node2D
@onready var interaction_area = $InteractionArea

var item = load("res://EQUIPMENT/_ITEMS/baller.tres")

func _ready() -> void:
	interaction_area.interact = Callable(self, "_openMachine")
	
func _openMachine():
	Inventoryctrl.add_item(item)
	print_debug("added a weapon")
