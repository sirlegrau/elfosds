extends Node2D


var loot ={
	"exp" : 0,
	"silk" : 0,
	"honey" :0
}


var inventory:Array

var item = load("res://EQUIPMENT/_ITEMS/weapon.tres")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	inventory.append(item)
	for items in inventory:
		print(items.name)
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
