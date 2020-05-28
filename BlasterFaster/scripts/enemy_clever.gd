#script: enemy_clever
extends "enemy.gd"

const scn_laser = preload("res://scenes/laser_enemy.tscn")

func _ready():
	velocity.x = Utils.choose([velocity.x, -velocity.x])
	print(velocity)
	yield(Utils.create_timer(1), "timeout")
	shoot()
	pass

func _process(delta):
	if position.x <= 0+16:
		velocity.x = abs(velocity.x)
	if position.x >= Utils.view_size.x - 16:
		velocity.x = -abs(velocity.x)
	
	pass
func shoot():
	while true:
		var laser = scn_laser.instance()
		laser.position = $cannon.global_position
		Utils.main_node.add_child(laser)
		yield(Utils.create_timer(1.5), "timeout")
