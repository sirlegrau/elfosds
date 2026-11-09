extends Control

@onready var grid_container = $GridContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Inventoryctrl.inventory_updated.connect(_on_inventory_updated)
	_on_inventory_updated()
	pass # Replace with function body.

func _on_inventory_updated():
	clear_grid_container()
	for i in range(Datactrl.inventory.size()):
		var slot = Inventoryctrl.inventory_slot_scene.instantiate()
		grid_container.add_child(slot)
		var item = Datactrl.inventory[i]
		if item != null:
			slot.set_item_inventory(item, i)
		else:
			slot.set_empty
	
func clear_grid_container():
	while grid_container.get_child_count() > 0:
		var child = grid_container.get_child(0)
		grid_container.remove_child(child)
		child.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
