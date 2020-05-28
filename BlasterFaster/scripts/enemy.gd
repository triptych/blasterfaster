# script: enemy
extends Area2D

export var armor = 2 setget set_armor
export var velocity = Vector2()

const scn_explosion = preload("res://scenes/explosion.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	add_to_group("enemy")
	connect("area_entered",self, "_on_area_enter")
	pass # Replace with function body.

func _process(delta):
	translate(velocity * delta)
	
	if position.y - 16 >= get_viewport_rect().size.y:
		queue_free()
	pass
	
func set_armor(new_value):
	if is_queued_for_deletion(): return
	if armor > new_value:
		AudioPlayer.play("snd_hit_enemy")
	
	armor = new_value
	if armor <=0: 
		get_node("/root/world/hud/tex_score").score +=5
		# get_node("/root/world/tex_score").score += 5
		# get_node("/root/world/hud/tex_score/label").score += 5
		create_explosion()
		queue_free()
	pass	
	
func _on_area_enter(other):
	if other.is_in_group("ship"):
		other.armor -= 1
		create_explosion()
		queue_free()
	pass	
	
	
	
func create_explosion():
	var explosion = scn_explosion.instance()
	explosion.position = position
	Utils.main_node.add_child(explosion)	
