#script: laser
extends Area2D

export var velocity = Vector2()
const scn_flare = preload("res://scenes/flare.tscn")

func _ready():
	set_process(true)
	create_flare()
	
	yield($vis_notifier, "screen_exited")
	queue_free()
	pass

func _process(delta):
	translate(velocity * delta)
	pass

func create_flare(): 
	var flare = scn_flare.instance()
	flare.position = position
	Utils.main_node.add_child(flare)
	pass
