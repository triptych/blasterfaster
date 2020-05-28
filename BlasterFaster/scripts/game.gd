extends Node

var best_score=0 setget _set_bestscore
const filepath = "user://bestscore.data"


func _ready():
	load_best_score()
	pass
	
func load_best_score():
	var file = File.new()
	if not file.file_exists(filepath): return
	
	file.open(filepath, File.READ)
	best_score = file.get_var()
	file.close()
	pass
	
func save_best_score():
	var file = File.new()
	file.open(filepath, File.WRITE)
	file.store_var(best_score)
	file.close()
		
func _set_bestscore(new_value):
	best_score = new_value
	save_best_score()
