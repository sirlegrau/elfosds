extends Control

@onready var hpcontainer = $hpcontainer
var icon
var red  = Color(1.0, 0.0, 0.0, 1.0)
var black = Color(0.0, 0.0, 0.0, 1.0)
@export var hpTexture : Texture
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Inventoryctrl.drawWardrobe();
	Inventoryctrl.drawInventory();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	GUIhandler()
	pass
	
func GUIhandler() -> void:
	$gold.text =str(Datactrl.playerHP)
	$xmas.text = str(Datactrl.loot["xmas"])
	$sleep.text = formatTime(Globalctr.sleepyTime)
	for hp in hpcontainer.get_children():
		hp.queue_free()
	for hp in (Datactrl.playerHP):
		icon = TextureRect.new()
		icon.texture = hpTexture
		hpcontainer.add_child(icon)
	pass

func formatTime(time:int)-> String:
	var minutes = floor(time/60)
	var second = time%60
	if(time <= 10):
		$sleep.set("theme_override_colors/font_color",red)
	else:
		$sleep.set("theme_override_colors/font_color",black)
	return str(minutes).pad_zeros(2) + ":" + str(second).pad_zeros(2)
