extends Sprite2D



func _process(delta: float) -> void:
	position = position + Vector2.DOWN*delta
