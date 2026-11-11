extends Control

# Will this work on browser?
@onready var todayDate = Time.get_datetime_dict_from_system()
@onready var buttons = preload("res://calendar_piece.tscn")

@export var month = 11


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(todayDate.month == month):
		_FunnyChristmasAddon()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _FunnyChristmasAddon ():

	var myArray = randomArray() 
	for i in range(24):
		get_child(1).get_child(i).get_child(1).text = str(myArray[i])

	for i in range(24):
		if(todayDate.day > i):
			for y in range(24):
				var childY = get_child(1).get_child(y)
				if(int(childY.get_child(1).text) == i+1):
					childY.get_child(0).set_color(Color(0,0,0,0))
					childY.get_child(1).visible = false


func randomArray() -> Array:
	var array : Array = []
	for i in range(24):
		array.append(i+1)
	array.shuffle() 
	return array
