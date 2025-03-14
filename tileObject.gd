class_name TileObject
extends StaticBody2D


var ray 
var tile_size = 16
var direction
var actions = []
var currentActionIndex = 0

var animation_speed = 3
var moving = false

func _ready() -> void:
	ray = RayCast2D.new()
	add_child(ray)	
	Gridmanager.StartMove.connect(move)
	_setup()
	
func _setup() -> void:
	pass
	
func move():
	var action = actions[currentActionIndex]
	ray.target_position = action* tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		var tween = create_tween()
		tween.tween_property(self, "position",position + action * tile_size, Gridmanager.animTime).set_trans(Tween.TRANS_SINE)
		moving = true
		await tween.finished
		moving = false
		currentActionIndex =currentActionIndex +1
		if currentActionIndex>=actions.size():
			currentActionIndex=0

		
