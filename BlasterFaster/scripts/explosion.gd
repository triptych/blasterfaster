#script: explosion

extends Sprite

func _ready():
	# yield(Utils.create_timer(1), "timeout")
	AudioPlayer.play("snd_explosion")
	randomize()
	rotation_degrees = rand_range(0, 360)
	$p_smoke.emitting = true
	
	Utils.remote_call("camera", "shake", 8, 0.2)
	
	$anim.play("fade_out")
	yield($anim, "animation_finished")
	queue_free()
	pass
