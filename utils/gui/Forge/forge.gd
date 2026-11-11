extends Control

@onready var canCraft = $canCraft
@onready var xmas = $Control/xmascost
@onready var slots =$slots
@onready var mainSlot = $slots/mainslot
@onready var slot1 = $slots/slot
@onready var slot2 = $slots/slot2
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
	print("removed")
	slot1.visible = false
	slot2.visible = false

func _forgeItemAdded(data:Variant):
	if(data.property["ITEM"].name != null):
		print(data.property["ITEM"].name)
		print(data.level)
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
