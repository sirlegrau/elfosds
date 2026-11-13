extends Slot


signal forgeItemAdded
signal forgeItemRemoved
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _get_drag_data(at_position: Vector2) -> Variant:
	super(at_position)
	forgeItemRemoved.emit()
	return slot_info
	
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is TextureRect and (data.type == ("WEAPON") or data.type == "HA" or data.type == "SWEATER")
		
func _drop_data(at_position: Vector2, data: Variant) -> void:
	forgeItemAdded.emit(data)
	super(at_position, data)
	
