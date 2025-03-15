class_name Tile
extends Area2D

var pushMN = "push"
var useMN = "use"

var tile_size = 16
var ray :RayCast2D
var animation_speed = 3
@export var weight = 1


var item = null

func _ready() -> void:
	ray = RayCast2D.new()
	ray.collide_with_areas=true
	add_child(ray)	
	add_to_group("tile")
	_setup()
	_tile_init()
	Gridmanager.StopMove.connect(movementStoppedGlobaly)
	movementStoppedGlobaly()
	
func movementStoppedGlobaly():
	pass

func _tile_init() -> void:
	pass
func _setup() -> void:
	pass

func snap():
	var x = position.x
	x = x/tile_size
	x = roundf(x)
	x = x*tile_size
	position.x = x
	var y = position.y
	y = y/tile_size
	y = roundf(y)
	y = y*tile_size
	position.y = y
	
func teleport(newpos):
	position = newpos

func is_tile_free_direction(dir:Vector2)->bool:
	ray.target_position = dir * tile_size
	ray.force_raycast_update()
	return !ray.is_colliding()
	
func tween_in_direction(dir:Vector2) -> Tween:
	var tween = create_tween()
	tween.tween_property(self, "position",position + dir * tile_size, Gridmanager.animTime).set_trans(Tween.TRANS_SINE)
	return tween
		
func push(dir:Vector2) -> bool:
	if	!is_tile_free_direction(dir):
		var hit = ray.get_collider()
		if hit.get("weight")!=null && hit.get("weight")<=weight:
			if hit.call(pushMN,dir):
				tween_in_direction(dir)
				return true
	else:
		tween_in_direction(dir)
		return true
	return false
