extends PanelContainer



@export var item: Item
@onready var button = $Button
signal workbenchItemPressed
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	self.add_to_group("WORKBENCHSLOT")
	button.icon = item.texture

func _on_button_pressed() -> void:
	workbenchItemPressed.emit(item)
	pass # Replace with function body.
