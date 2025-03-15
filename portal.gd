class_name portal

extends TileObject

@export var partner_portal:portal
@export var isActive = false

func movementStoppedGlobaly():
	if !isActive:
		return
	for body in get_overlapping_areas():
		if	body.has_method("teleport"):
			body.call("teleport",partner_portal.position) 			
					
