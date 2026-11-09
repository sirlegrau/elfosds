extends Control

var couentaCDGnomo : int = 0
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $Horizontal/OtherInfo/Label2/AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	Globalctr._launchGameTheGameGameNotTheBrotatoOne()
	self.queue_free()



func _on_label_2_pressed() -> void:
	if(couentaCDGnomo>=100):
		print("Cd unlocked")
		audio_stream_player_2d.play()
	else:
		couentaCDGnomo+=1
		print(couentaCDGnomo)
