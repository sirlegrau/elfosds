extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	GUIhandler()
	pass
func GUIhandler() -> void:
	$hp.text ="HP: " + str(Datactrl.playerHP)
	$xmas.text = str(Datactrl.loot["exp"])
	$sleep.text = str(int(Globalctr.sleepyTime))
	pass
