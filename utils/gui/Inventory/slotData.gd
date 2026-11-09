extends TextureRect

@export_enum("HAT", "WEAPON", "SWEATER", "ANY") var type: String

@export var item:Item

@onready var property: Dictionary = {"TEXTURE": texture,
									"SLOT_TYPE": type,
									"ITEM":item
									}:
										set(value):
											property = value
											texture = property["TEXTURE"]
											type = property["SLOT_TYPE"]
											item = property["ITEM"]
		
