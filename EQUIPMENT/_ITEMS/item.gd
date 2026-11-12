class_name Item
extends Resource


@export var name:String
#REPRESENTACION INGAME COMO ESCENA
@export var scene:PackedScene
#REPRESENTACION EN EL HUD COMO TEXTURA 2D
@export var texture:Texture
@export var cost: Array[Array]  ###  [Loot, int]  NESTED TYPED COLLECTIONS ARE NOT SUPPORTED IN GODOT 4
@export var level:int = 1
@export_enum("HAT", "WEAPON", "SWEATER") var type: String
