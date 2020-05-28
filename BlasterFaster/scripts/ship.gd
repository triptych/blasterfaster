extends Area2D

var is_double_shooting = false setget set_double_shooting

const scn_laser = preload("res://scenes/laser_ship.tscn")
const scn_explosion = preload("res://scenes/explosion.tscn")
const scn_flash = preload("res://scenes/flash.tscn")

signal armor_changed 

var armor = 4 setget set_armor
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	
	add_to_group("ship")
	
	yield(Utils.create_timer(0.5), "timeout")
	shoot()
	pass # Replace with function body.
	
func _process(delta):
	# var x = get_global_mouse_position().x
	var motion =  (Utils.mouse_pos.x - position.x ) * 0.2
	# var y = position.y
	# position = Vector2(x,y)
	translate(Vector2(motion, 0))
	
	#clamping to view
	# var view_size = get_viewport_rect().size
	var pos = position
	position.x = clamp(position.x, 0 + 16 , Utils.view_size.x - 16)

func shoot():
	while true:
		print('shoot called')
		#var pos_left = get_node("cannons/left").position
		#var pos_right = get_node("cannons/right").position
		
	
		# print(pos_left)
		create_laser($cannons/left.global_position)
		create_laser($cannons/right.global_position)
		
		if is_double_shooting:
			var laser_left = create_laser($cannons/left.global_position)
			var laser_right = create_laser($cannons/right.global_position)
			
			laser_left.velocity.x =-25
			laser_right.velocity.x = 25
			
		yield(Utils.create_timer(0.25), "timeout")
	pass
	
func set_armor(new_value):
	if new_value > 4: return
	if new_value < armor:
		AudioPlayer.play("snd_hit_ship")
		Utils.main_node.add_child(scn_flash.instance())
	armor = new_value
	emit_signal("armor_changed", armor)
	if armor <= 0: 
		create_explosion()
		queue_free()
	pass
	
		
func create_laser(pos):
	var laser = scn_laser.instance()
	laser.position = pos
	Utils.main_node.add_child(laser)
	return laser
	pass
	
func create_explosion():
	var explosion = scn_explosion.instance()
	explosion.position = position
	Utils.main_node.add_child(explosion)

func set_double_shooting(new_value):
	is_double_shooting = new_value
	
	if is_double_shooting:
		yield(Utils.create_timer(5), "timeout")
		is_double_shooting = false
	pass	
