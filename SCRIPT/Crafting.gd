extends Node2D
@onready var interaction_area = $InteractionArea

func _ready() -> void:
	interaction_area.interact = Callable(self, "_openMachine")
	
func _openMachine():
	print("ding ding")
