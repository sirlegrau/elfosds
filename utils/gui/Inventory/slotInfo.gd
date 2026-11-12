extends TextureRect
@export var color = [Color(0.82, 0.871, 0.871, 1.0), Color(1.0, 1.0, 1.0, 1.0), Color(0.0, 0.653, 0.0, 1.0),
Color(1.0, 0.898, 0.0, 1.0),
Color(1.0, 0.024, 0.18, 1.0),
Color(0.935, 0.0, 0.766, 1.0)]
@export_enum("HAT", "WEAPON", "SWEATER") var type: String
@export_enum("1", "2", "3", "4", "5") var level: String
@export var item :Item = null :
	set(value):
		item = value
		if (item != null):
			%Name.text = item.name	
			%Level.text = "Level : " + str(item.level)
			%levelborder.modulate = color[item.level]
			
			type = item.type
			level = str(item.level)
		else:
			%Name.text = ""
			%Level.text = ""
			

@onready var property: Dictionary = {"TEXTURE": texture,
									"SLOT_TYPE": type,
									"ITEM":item
									}:
										set(value):
											property = value
											texture = property["TEXTURE"]
											type = property["SLOT_TYPE"]
											item = property["ITEM"]
											
											
		
