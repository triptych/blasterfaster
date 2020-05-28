#script: powerup

extends Area2D
var velocity = Vector2(0,200)

func _ready():
	set_process(true)
	pass

func _process(delta):
	translate(velocity * delta)
	
	if position.y >= Utils.view_size.y+7:
		queue_free()
	pass
	
