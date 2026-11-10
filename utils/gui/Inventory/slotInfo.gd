extends TextureRect

@export_enum("HAT", "WEAPON", "SWEATER", "ANY") var type: String

@export var item = null :
	set(value):
		item = value
		if (item != null):
			%Name.text = item.name	
			%Level.text = "Level : " + str(item.level)
			type = item.type
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
											
		
