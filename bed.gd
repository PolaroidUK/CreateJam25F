extends TileObject
func use(user):
	user.position = position
	user.position.y = user.position.y +8
	user.sleeping = true
	user.remove_from_group("tile")
	$Label.text = "Good Night"
	
