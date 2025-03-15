class_name portal
extends TileObject

@export var partner_portal:portal


func movementStoppedGlobaly():
	for body in get_overlapping_areas():
		if	body.has_method("teleport"):
			body.call("teleport",partner_portal.position) 			
					
