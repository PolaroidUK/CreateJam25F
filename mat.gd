extends TileObject



func use(user :Tile):
	if item == null:
		item = user.take_item()
		item.reparent(self)		
		item.position = Vector2.ZERO
		
		print("you win")
	
		
	
func store_item(new_item:Area2D):
	new_item.reparent(self)	
	item = new_item
	item.position = Vector2.ZERO
