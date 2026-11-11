extends Control

@onready var icon = $icon
@onready var cost = $cost
@export var texture : Texture
@export var costSet : int
@export var color :Color = Color(1.0, 0.0, 0.0, 1.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	icon.texture = texture
	cost.text = str(costSet)
	cost.set("theme_override_colors/font_color",color)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
