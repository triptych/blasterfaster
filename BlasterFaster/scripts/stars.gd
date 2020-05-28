#script: star

extends Sprite

export var velocity = Vector2()

func _ready():
	set_process(true)
	pass # Replace with function body.

func _process(delta):
	translate( velocity * delta)
	
	if position.y >= get_viewport_rect().size.y:
		position = Vector2(0,-180)
	pass

