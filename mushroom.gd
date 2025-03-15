extends TileObject

@export var nextLevelnumber = "1"
	
func movementStoppedGlobaly():
	for body in get_overlapping_areas():
		if	body.has_method("eat"):
			eat()
			
			
func eat():
	get_tree().call_deferred("change_scene_to_file","res://Levels/level_" + nextLevelnumber +".tscn")
					
