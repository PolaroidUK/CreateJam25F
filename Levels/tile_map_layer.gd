extends CanvasItem

static var fkd: float = 0.0
var increase: float = 0.005

func _ready() -> void:
	material.set_shader_parameter("intensity", fkd)
	Gridmanager.SceneChange.connect(increase_fukd)

func increase_fukd() -> void:
	fkd += increase
	print("fdk", fkd)
	material.set_shader_parameter("intensity", fkd)
	
	
	
