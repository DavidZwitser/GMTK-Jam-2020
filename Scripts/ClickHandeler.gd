extends Node

var power: float = 0
export var clickTime: float = 0.5

signal beatPressedSignal
signal beatReleaseSignal(value)
var clicked = false

func _process(delta):
	if (Input.is_action_pressed("beatClick")):
		holdClick()
	
	if (Input.is_action_just_released("beatClick")):
		releaseClick()
	
	if (clicked):
		power += delta
		if (power > clickTime):
			releaseClick()

func holdClick():
	if (clicked):
		return
	emit_signal("beatPressedSignal")
	clicked = true

func releaseClick():
	if (!clicked):
		return
	emit_signal("beatReleaseSignal", power / clickTime)
	power = 0
	clicked = false
