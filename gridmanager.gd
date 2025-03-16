extends Node


signal StartMove
signal StopMove
signal SceneChange
var timer:Timer

var currentSceneVal = 0
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
	
func change_scene():	
	currentSceneVal = currentSceneVal + 1
	get_tree().call_deferred("change_scene_to_file","res://Levels/level_" + str(currentSceneVal) +".tscn")
	SceneChange.emit()
	
	if currentSceneVal ==4:
		AudioServer.set_bus_mute(1,true)
		AudioServer.set_bus_mute(3,false)
	if currentSceneVal ==6:
		AudioServer.set_bus_mute(3,true)
		AudioServer.set_bus_mute(4,false)
	if currentSceneVal ==8:
		AudioServer.set_bus_mute(4,true)
		AudioServer.set_bus_mute(5,false)
	if currentSceneVal ==10:
		AudioServer.set_bus_mute(5,true)
		AudioServer.set_bus_mute(6,false)		
	
