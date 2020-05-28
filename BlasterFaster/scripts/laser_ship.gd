#scrip: laser_ship

extends "res://scripts/laser.gd"

func _ready():
	connect("area_entered", self, "_on_area_enter")
	AudioPlayer.play("snd_laser_ship")
	pass
func _on_area_enter(other):	
	if other.is_in_group("enemy"):	
		other.armor -= 1
		create_flare()
		Utils.remote_call("camera", "shake", 1, 0.13)
		queue_free()
	pass
