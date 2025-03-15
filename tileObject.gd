class_name TileObject
extends Tile

@export var actions = []
var currentActionIndex = 0

	
func _tile_init() -> void:	
	if	actions.size()>0:
		Gridmanager.StartMove.connect(move)
	
func move():
	var action = actions[currentActionIndex]
	if is_tile_free_direction(action):
		tween_in_direction(action)
		iterate_actions()
	else:
		var hit = ray.get_collider()
		if (hit.has_method(pushMN)):
			if hit.call(pushMN,action):
				tween_in_direction(action)
				iterate_actions()
				
func iterate_actions():
	currentActionIndex =currentActionIndex + 1
	if currentActionIndex>=actions.size():
		currentActionIndex=0
