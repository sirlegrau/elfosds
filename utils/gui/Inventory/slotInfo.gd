extends TextureRect

@export_enum("HAT", "WEAPON", "SWEATER") var type: String
@export_enum("1", "2", "3", "4", "5") var level: String
@export var item = null :
	set(value):
		item = value
		if (item != null):
			%Name.text = item.name	
			%Level.text = "Level : " + str(item.level)
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
											
											
		
