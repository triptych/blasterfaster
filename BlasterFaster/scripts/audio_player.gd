extends Node2D

func _ready():
	pass


func play(sample_name):
	get_node(sample_name).play()
