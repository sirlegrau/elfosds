extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	%loot1.text = str(Datactrl.loot["silk"])
	%loot2.text = str(Datactrl.loot["eye"])
	%loot3.text = str(Datactrl.loot["bone"])
	%loot4.text = str(Datactrl.loot["blood"])
	%loot5.text = str(Datactrl.loot["horn"])
	pass
