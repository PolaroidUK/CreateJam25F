extends Tile

var inputs = {"ui_right": Vector2.RIGHT,"ui_left": Vector2.LEFT,"ui_up": Vector2.UP,"ui_down": Vector2.DOWN}

var moving = false



func move(dir:Vector2):
	if is_tile_free_direction(dir):
		moving = true
		await tween_in_direction(dir).finished	
		Gridmanager.StartMove.emit()
	else:
		var hit = ray.get_collider()
		if (hit.has_method(useMN)):
			hit.call(useMN,self) 
			Gridmanager.StartMove.emit()

func _unhandled_input(event):
	if moving:
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(inputs[dir])
			
func movementStoppedGlobaly():
	moving = false	
	for dir in inputs.keys():
		if Input.is_action_pressed(dir):
			move(inputs[dir])

func give_item(new_item:Area2D):
	new_item.reparent(self)	
	item = new_item
	item.position = Vector2.ZERO

func take_item() -> Area2D:
	var item_to_Give = item
	item = null
	return item_to_Give	
	
	
func eat():
	print("win")



	
