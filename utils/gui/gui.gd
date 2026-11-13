extends Control

@onready var hpcontainer = $hpcontainer
var icon
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
	$xmas.text = str(Datactrl.loot["exp"])
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
	return str(minutes).pad_zeros(2) + ":" + str(second).pad_zeros(2)
