extends Tile
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var inputs = {"move-right": Vector2.RIGHT,"move-left": Vector2.LEFT,"move-up": Vector2.UP,"move-down": Vector2.DOWN}
var inputsflipped = {"move-right": Vector2.LEFT,"move-left": Vector2.RIGHT,"move-up": Vector2.DOWN,"move-down": Vector2.UP}
var moving = false
var moving_in_dir = Vector2.ZERO
@export var isDrunk = false
var movecount = 0

func animate() -> void:
	match moving_in_dir:
		Vector2.RIGHT:
			animated_sprite_2d.play("run_right")
		Vector2.LEFT:
			animated_sprite_2d.play("run_left")
		Vector2.UP:
			animated_sprite_2d.play("run_up")
		Vector2.DOWN:
			animated_sprite_2d.play("run_down")
		_:
			animated_sprite_2d.play("idle")

func _process(delta: float) -> void:
	animate()

func move(dir:Vector2):
	if is_tile_free_direction(dir):
		moving = true
		moving_in_dir = dir;
		await tween_in_direction(dir).finished
		for body in get_overlapping_areas():
			if	body.has_method("eat"):
				body.call("eat")
		Gridmanager.StartMove.emit()
		movecount = movecount + 1
	else:
		var hit = ray.get_collider()
		if (hit.has_method(useMN)):
			hit.call(useMN,self) 
			Gridmanager.StartMove.emit()
			movecount = movecount + 1

func _unhandled_input(event):
	if moving:
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			if isDrunk && movecount%4==3:
				move(inputsflipped[dir])
			else:
				move(inputs[dir])
			
func movementStoppedGlobaly():
	moving = false	
	moving_in_dir = Vector2.ZERO
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
