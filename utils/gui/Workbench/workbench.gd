extends Control

var selectedItem:Item 
@onready var costgrid = $costGrid
@onready var canCraft = $canCraft
@onready var xmas = $Control/xmascost

var lootCost = preload("res://utils/gui/Workbench/lootCost.tscn")


var red = Color(1.0, 0.0, 0.0, 1.0)
var white = Color(1.0, 1.0, 1.0, 1.0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for slot in self.get_children():
		if slot.is_in_group("WORKBENCHSLOT"):
			slot.workbenchItemPressed.connect(_workbenchItemPressed)
	canCraft.disabled = true
	displayXMAS()
	pass # Replace with function body.


func _workbenchItemPressed(item:Item):
	canCraft.disabled = false
	
	clearCostGrid()
	selectedItem = item
	print (item.name)
	
	### cost is an Array with [Loot, int]
	for cost in selectedItem.cost:
		displayCost(cost)
		
	displayXMAS()
	
	
func checkCost(cost:Array):
	var costName = cost[0].name
	var costAmount = cost[1] + Datactrl.timesbought[selectedItem.name]
	var availableResource = Datactrl.loot[costName]
	if (costAmount > availableResource):
		canCraft.disabled = true 
		return red
	else:
		return white
	pass


func displayCost(cost:Array):
	var lootCostScene = lootCost.instantiate()
	lootCostScene.texture = cost[0].texture
	lootCostScene.costSet = cost[1] + Datactrl.timesbought[selectedItem.name]
	lootCostScene.color = checkCost(cost)
	costgrid.add_child(lootCostScene)	
	
	
func clearCostGrid():
	for node in costgrid.get_children():
		node.queue_free()
		
func displayXMAS():
	var availableXMAS = Datactrl.loot["exp"]
	var timesUSED = Datactrl.timesbought["WORKBENCH"]
	var currentCost = int(((timesUSED*timesUSED)+timesUSED)/2)+1
	xmas.text = str(currentCost)
	if(currentCost>availableXMAS):
		canCraft.disabled = true
		xmas.set("theme_override_colors/font_color",red)
	else:
		xmas.set("theme_override_colors/font_color",white)


func _on_can_craft_pressed() -> void:
	payLoot()
	Inventoryctrl.add_item(selectedItem)
	Datactrl.timesbought[selectedItem.name] += 1
	Datactrl.timesbought["WORKBENCH"] +=1
	_workbenchItemPressed(selectedItem)


func payLoot() :
	for cost in selectedItem.cost:
		var costName = cost[0].name
		var costAmount = cost[1] + Datactrl.timesbought[selectedItem.name]
		Datactrl.loot[costName] -= costAmount
	
	var timesUSED = Datactrl.timesbought["WORKBENCH"]
	var currentCost = int(((timesUSED*timesUSED)+timesUSED)/2)+1
	Datactrl.loot["exp"] -= currentCost
	
	
