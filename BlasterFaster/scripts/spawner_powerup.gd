# script: spawner_powerup
extends Node

#const enemy_kamikaze = preload("res://scenes/enemy_kamakaze.tscn")

const powerups = [
	preload("res://scenes/powerup_armor.tscn"),
	preload("res://scenes/powerup_laser.tscn")
]

func _ready():
	spawn()
	pass # Replace with function body.

func spawn():
	yield(Utils.create_timer(rand_range(10, 15)), "timeout")
	while true:
		randomize()
		var enemy = Utils.choose(powerups).instance()
		var pos = Vector2()
		# pos.x = rand_range(0+16, get_viewport().get_visible_rect().size.x-16)
		pos.x = rand_range(0+7, Utils.view_size.x-7)
		print(pos)
		pos.y = 0 - 7
		enemy.position = pos
		get_node("container").add_child(enemy)
		yield(Utils.create_timer(rand_range(10, 15)), "timeout")
	pass
