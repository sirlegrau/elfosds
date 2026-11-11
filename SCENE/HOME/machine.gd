extends Node2D
@onready var interaction_area = $InteractionArea
@onready var machine = $Machine
@export_enum("WARDROBE", "WORKBENCH", "FORGE")var type: String
@export var texture = Texture


func _ready() -> void:
	machine.texture = texture
	interaction_area.interact = Callable(self, "_openMachine")
	
func _openMachine():
	Inventoryctrl._openMachine(type)
