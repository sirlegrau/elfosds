extends Control

@onready var canCraft = $canCraft
@onready var xmas = $Control/xmascost
@onready var slots =$slots
@onready var mainSlot = $slots/mainslot
@onready var slot1 = $slots/slot
@onready var slot2 = $slots/slot2
var weapon = load("res://EQUIPMENT/_ITEMS/weapon.tres")
var red = Color(1.0, 0.0, 0.0, 1.0)
var white = Color(1.0, 1.0, 1.0, 1.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	mainSlot.forgeItemAdded.connect(_forgeItemAdded)
	mainSlot.forgeItemRemoved.connect(_forgeItemRemoved)
	canCraft.disabled = true
	displayXMAS()
	slot1.visible = false
	slot2. visible = false
	pass # Replace with function body.

func _forgeItemRemoved():
	slot1.visible = false
	slot2.visible = false

func _forgeItemAdded(data:Variant):
	slot1.visible = true
	slot2.visible = true
	
	slot2.level = str(data.level)
	slot1.level = str(data.level)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(mainSlot.slot_info.item != null && slot1.slot_info.item != null && slot2.slot_info.item != null):
		canCraft.disabled = false
	pass


func displayXMAS():
	var availableXMAS = Datactrl.loot["exp"]
	var timesUSED = Datactrl.timesbought["FORGE"]
	var currentCost = int(((timesUSED*timesUSED)+timesUSED)/2)+1
	xmas.text = str(currentCost)
	if(currentCost>availableXMAS):
		canCraft.disabled = true
		xmas.set("theme_override_colors/font_color",red)
	else:
		xmas.set("theme_override_colors/font_color",white)


func _on_can_craft_pressed() -> void:
	canCraft.disabled = true
	var item = mainSlot.slot_info.property["ITEM"].duplicate(true)
	item.level +=1
	Inventoryctrl.updateInventory()
	Inventoryctrl.drawInventory()
	Inventoryctrl.add_item(item)
	for slot in slots.get_children():
		slot.set_empty()
	Datactrl.timesbought["FORGE"] += 1
	displayXMAS()
	slot1.visible = false
	slot2.visible = false
	pass # Replace with function body.
