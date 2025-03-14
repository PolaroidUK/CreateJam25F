extends StaticBody2D


var inputs = {"ui_right": Vector2.RIGHT,"ui_left": Vector2.LEFT,"ui_up": Vector2.UP,"ui_down": Vector2.DOWN}

var ray :RayCast2D
var tile_size = 16

var animation_speed = 3
var moving = false

var use = "use"

var hasPlant = false

func _ready() -> void:
	ray = RayCast2D.new()
	add_child(ray)
	Gridmanager.StopMove.connect(movementStoppedGlobaly)
	

func move(dir:Vector2):
	ray.target_position = dir * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		var tween = create_tween()
		tween.tween_property(self, "position",position + dir *  
		  tile_size, Gridmanager.animTime).set_trans(Tween.TRANS_SINE)
		moving = true
		await tween.finished		
		Gridmanager.StartMove.emit()
	else:
		var hit = ray.get_collider()
		if (hit.has_method(use)):
			hit.call(use,self) 
			Gridmanager.StartMove.emit()

func _unhandled_input(event):
	if moving:
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(inputs[dir])
			
func movementStoppedGlobaly():
	moving = false

func Give():
	hasPlant = true
	print("i took flower")

func Take():
	hasPlant = true
	print("i gave flower")


	
