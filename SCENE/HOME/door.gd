extends Node2D
@onready var interaction_area = $InteractionArea
@onready var player  = $"../playerhome"
func _ready() -> void:
	interaction_area.interact = Callable(self, "_openDoor")

func _openDoor():
	player.remove_from_group("Player")
	Globalctr._startGame()
