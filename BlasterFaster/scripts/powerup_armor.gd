#script: powerup armor

extends "res://scripts/powerup.gd"

func _ready():
	pass


func _on_powerup_armor_area_entered(area):
	if area.is_in_group("ship"): 
		AudioPlayer.play("snd_powerup")
		area.armor += 1
		queue_free()
	pass # Replace with function body.
