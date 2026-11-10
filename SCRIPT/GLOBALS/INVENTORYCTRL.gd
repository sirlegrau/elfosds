extends Node

@onready var inventory_slot_scene = preload("res://utils/gui/Inventory/slot.tscn")
@export var weapon = load("res://EQUIPMENT/_ITEMS/weapon.tres")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Datactrl.inventory.resize(12)
	Datactrl.wardrobe.resize(4)
	pass


###ADDS AN ITEM TO INVENTORY RETURN TRUE IF SUCCESS
func add_item(item: Item):
	for i in range(Datactrl.inventory.size()):
		if Datactrl.inventory[i] == null:
			Datactrl.inventory[i] = item
			drawInventory()
			return
		else:
			pass
	
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _openMachine(which:String):
	match which:
		"WARDROBE":
			openWardrobe()
		"WORKBENCH":
			openWorkbench()
	openInventory()
		


func closeALL():
	closeInventory()
	closeWardrobe()
	closeWorkbench()
func drawALL():
	drawInventory()
	drawWardrobe()
func closeWorkbench():
	var workbench = get_tree().get_first_node_in_group("WORKBENCH")
	workbench.visible = false
	Inventoryctrl.drawInventory()
func openWorkbench():
	var workbench = get_tree().get_first_node_in_group("WORKBENCH")
	workbench.visible = true
	Inventoryctrl.drawInventory()
func closeWardrobe():
	var wardrobe = get_tree().get_first_node_in_group("WARDROBE")
	wardrobe.visible = false
	Inventoryctrl.updateWardrobe()
func openWardrobe():
	var slots = get_tree().get_first_node_in_group("WARDROBE")
	slots.visible = true
	Inventoryctrl.drawWardrobe()
func closeInventory():
	var inventory = get_tree().get_first_node_in_group("INVENTORY")
	inventory.visible = false
	Inventoryctrl.updateInventory()
func openInventory():
	var inventory = get_tree().get_first_node_in_group("INVENTORY")
	inventory.visible = true
	Inventoryctrl.drawInventory()

func drawInventory():
	var slots = get_tree().get_first_node_in_group("INVENTORY")
	var index = 0;
	if(slots != null):
		print("IM not null and this is the inventory")
		for slot in slots.get_children():
			slot.set_item(Datactrl.inventory[index])
			print(Datactrl.inventory[index])
			index+=1
			
func updateInventory():
	var wardrobe = get_tree().get_first_node_in_group("INVENTORY")
	var index = 0;
	if(wardrobe != null):
		for slot in wardrobe.get_children():
			Datactrl.inventory[index] = slot.slot_info.item
			index+=1

func drawWardrobe():
	var slots = get_tree().get_first_node_in_group("WARDROBE")
	var index = 0;
	if(slots != null):
		for slot in slots.get_children():
			slot.set_item(Datactrl.wardrobe[index])
			index+=1
func updateWardrobe():
	var slots = get_tree().get_first_node_in_group("WARDROBE")
	var index = 0;
	if(slots != null):
		for slot in slots.get_children():
			Datactrl.wardrobe[index] = slot.slot_info.item
			index+=1
			
