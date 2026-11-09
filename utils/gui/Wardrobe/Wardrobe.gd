extends Control

@onready var grid_container = $GridContainer

var weapon = load("res://EQUIPMENT/_ITEMS/weapon.tres")
var baller = load("res://EQUIPMENT/_ITEMS/baller.tres")
var itemsWB = [weapon, baller]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for i in itemsWB:
		var slot = Inventoryctrl.inventory_slot_scene.instantiate()
		grid_container.add_child(slot)
		if i != null:
			slot.set_item(i)
		else:
			slot.set_empty

		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
