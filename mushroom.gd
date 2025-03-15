extends TileObject

@export var nextLevelnumber = "1"
	
func movementStoppedGlobaly():
	for body in get_overlapping_areas():
		if	body.has_method("eat"):
			eat()
			
			
func eat():
	Gridmanager.change_scene()
					
