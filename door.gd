extends TileObject

var hasPlant = true

func _setup() -> void:
	actions = [Vector2.DOWN,Vector2.LEFT,Vector2.RIGHT,Vector2.UP]


func use(user):
	if hasPlant:
		user.Give()
		hasPlant=false
	else:
		user.Take()
		hasPlant=true
