extends Control
class_name Slot

@export_enum("HAT", "WEAPON", "SWEATER", "ANY") var type: String = "ANY"
@export_enum("1","2", "3", "4", "5", "ANY") var level : String ="ANY"
@onready var slot_info = $icon


###
@onready var levelborder=$levelborder
@onready var hover = $Hovered
@onready var hoverName = $Hovered/Name
@onready var hoverLevel = $Hovered/Level

var inventorySlotPosition = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		%levelborder.modulate = Color(0.82, 0.871, 0.871, 1.0)
		hover.visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_empty():
	slot_info.texture = null
	slot_info.item = null
	slot_info.property["ITEM"] = null
	slot_info.property["TEXTURE"] = null
func set_item(newItem: Item,):
	if(newItem):
		slot_info.texture = newItem.texture
		slot_info.property["ITEM"] = newItem
		slot_info.item =newItem
		slot_info.property["TEXTURE"] = newItem.texture;
	else: set_empty()


func _get_drag_data(at_position: Vector2) -> Variant:
	set_drag_preview(get_preview())
	return slot_info
 
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is TextureRect and ( (self.type == "ANY") or self.type == data.type) and ((self.level == "ANY") or self.level == data.level)
		
 
func _drop_data(at_position: Vector2, data: Variant) -> void:
	var temp = slot_info.property
	slot_info.property = data.property
	data.property = temp
	

func get_preview():
	var preview_texture = TextureRect.new()
	preview_texture.texture = slot_info.texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(25,25)
	preview_texture.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	preview_texture.z_index = 101
	var preview = Control.new()
	preview.add_child(preview_texture)
	return preview

func _on_mouse_entered() -> void:
	if(slot_info.item != null):
		hover.visible = true
	pass 


func _on_mouse_exited() -> void:
	hover.visible = false
	pass
