extends Area2D


func _ready() -> void:
	Gridmanager.StopMove.connect(movementStoppedGlobaly)
	movementStoppedGlobaly()
	
func movementStoppedGlobaly():
	for body in get_overlapping_areas():
		if	body.has_method("give_item") && body.get("item")==null:			
			body.call("give_item",self)
			return
		elif body.has_method("store_item") && body.get("item")==null:
			body.call("store_item",self)
			return			
