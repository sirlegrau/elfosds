extends Control

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
	$hp.text ="HP: " + str(Datactrl.playerHP)
	$xmas.text = str(Datactrl.loot["exp"])
	$sleep.text = formatTime(Globalctr.sleepyTime)
	pass

func formatTime(time:int)-> String:
	var minutes = floor(time/60)
	var second = time%60
	return str(minutes).pad_zeros(2) + ":" + str(second).pad_zeros(2)
