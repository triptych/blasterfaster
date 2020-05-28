#script: powerup laser

extends "res://scripts/powerup.gd"

func _ready():
	pass


#func _on_powerup_armor_area_entered(area):
#	if area.is_in_group("ship"): 
#		print("it was a ship -- powr")
#		area.is_double_shooting = true
#		queue_free()
#	pass # Replace with function body.



func _on_powerup_laser_area_exited(area):
	if area.is_in_group("ship"): 
		AudioPlayer.play("snd_powerup")
		print("it was a ship -- powr")
		area.is_double_shooting = true
		queue_free()
	pass # Replace with function body.
