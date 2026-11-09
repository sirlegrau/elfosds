extends Control

###
@export var item = null


@onready var hover = $Hovered
@onready var hoverName = $Hovered/Name
@onready var hoverLevel = $Hovered/Level

@onready var button = $ColorRect/Button




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hover.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_mouse_entered() -> void:
	if item != null:
		hover.visible = true;
	pass # Replace with function body.


func _on_button_mouse_exited() -> void:
	
	hover.visible = false;
	pass # Replace with function body.
	
func set_empty():
	button.icon = null
	
func set_item(newItem: Item):
	item = newItem
	button.icon = item.texture;
	hoverName.text = item.name
	hoverLevel.text = "Level: " + str(item.level)
