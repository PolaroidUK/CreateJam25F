extends TileObject


func _setup() -> void:
	actions = [Vector2.DOWN,Vector2.LEFT,Vector2.RIGHT,Vector2.UP]


func use(user :Tile):
	if item == null:
		item = user.take_item()
		item.reparent(self)		
		item.position = Vector2.ZERO
	else:
		user.give_item(item)
		item = null	
		
	
func store_item(new_item:Area2D):
	new_item.reparent(self)	
	item = new_item
	item.position = Vector2.ZERO
