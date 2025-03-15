extends Node


signal StartMove
signal StopMove
var timer:Timer

var animTime = 0.4

func _ready() -> void:
	timer = Timer.new()
	timer.wait_time=animTime+0.1
	timer.one_shot = true
	add_child(timer)
	timer.timeout.connect(EndMovement)
	StartMove.connect(StartMovement)
	

func StartMovement() -> void:
	timer.start()

func EndMovement() -> void:
	get_tree().call_group("tile","snap")
	StopMove.emit()
	
