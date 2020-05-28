# script: spawner_enemy
extends Node

#const enemy_kamikaze = preload("res://scenes/enemy_kamakaze.tscn")

const enemies = [
	preload("res://scenes/enemy_kamakaze.tscn"),
	preload("res://scenes/enemy_clever.tscn")
]

func _ready():
	yield(Utils.create_timer(1.2), "timeout")
	
	spawn()
	pass # Replace with function body.

func spawn():
	while true:
		randomize()
		var enemy = Utils.choose(enemies).instance()
		var pos = Vector2()
		# pos.x = rand_range(0+16, get_viewport().get_visible_rect().size.x-16)
		pos.x = rand_range(0+16, Utils.view_size.x-16)
		print(pos)
		pos.y = 0 - 16
		enemy.position = pos
		get_node("container").add_child(enemy)
		yield(Utils.create_timer(rand_range(0.5, 1.25)), "timeout")
	pass
