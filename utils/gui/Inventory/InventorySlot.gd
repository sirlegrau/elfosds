extends Control

@onready var texture_rect = $icon


###
@onready var hover = $Hovered
@onready var hoverName = $Hovered/Name
@onready var hoverLevel = $Hovered/Level

var inventorySlotPosition = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(hover != null):
		hover.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_empty():
	texture_rect.texture = null
	texture_rect.item = null
	
func set_item_inventory(newItem: Item, i:int):
	texture_rect.item = newItem
	inventorySlotPosition = i;
	texture_rect.texture = texture_rect.item.texture;
	hoverName.text = texture_rect.item.name
	hoverLevel.text = "Level: " + str(texture_rect.item.level)
	
func set_item(newItem: Item,):
	texture_rect.texture = newItem.texture
	texture_rect.property["ITEM"] = newItem
	texture_rect.property["TEXTURE"] = newItem.texture;
	hoverName.text = texture_rect.property["ITEM"].name
	hoverLevel.text = "Level: " + str(texture_rect.property["ITEM"].level)


func _get_drag_data(at_position: Vector2) -> Variant:
	set_drag_preview(get_preview())
	return texture_rect
 
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is TextureRect
 
func _drop_data(at_position: Vector2, data: Variant) -> void:
	var temp = texture_rect.property
	texture_rect.property = data.property
	data.property = temp
	print(texture_rect.property)
func get_preview():
	var preview_texture = TextureRect.new()
 
	preview_texture.texture = texture_rect.texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(30,30)
	preview_texture.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
 
	var preview = Control.new()
	preview.add_child(preview_texture)
 
	return preview


func _on_mouse_entered() -> void:
	print(self.texture_rect.property)
	hover.visible = true
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	hover.visible = false
	pass # Replace with function body.
