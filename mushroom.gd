extends TileObject

signal eat
	
func movementStoppedGlobaly():
	for body in get_overlapping_areas():
		if	body.has_method("eat"):
			eat.emit()
					
