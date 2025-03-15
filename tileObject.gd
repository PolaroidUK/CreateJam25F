class_name TileObject
extends Tile

@export var actions : PackedVector2Array= []
var currentActionIndex = 0
@export var canPush = true
	
func _tile_init() -> void:
	if	actions.size()>0:
		Gridmanager.StartMove.connect(move)
	
func move():
	var action = actions[currentActionIndex]
	iterate_actions()
	if	action == Vector2.ZERO:
		return
	if action.length()>1.5:
		position = action
	if is_tile_free_direction(action):
		tween_in_direction(action)
		
	elif canPush:
		var hit = ray.get_collider()
		if (hit.has_method(pushMN)):
			if hit.call(pushMN,action):
				tween_in_direction(action)
	
				
func iterate_actions():
	currentActionIndex =currentActionIndex + 1
	if currentActionIndex>=actions.size():
		currentActionIndex=0
