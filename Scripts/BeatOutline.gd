extends Spatial

export var speed: float = .5
var currentSpeed: float
export var maxZ: float = -500

func _ready():
	resetScale()
	
func resetScale():
	currentSpeed = speed
	translation.z = 0
	pass

func _process(delta):
	currentSpeed += delta * 2

	translation.z -= currentSpeed * delta
	
	rotation.z = get_parent().getRotationFromZ(translation.z)
	
	#print(translation.z, maxZ)

	if translation.z < maxZ:
		resetScale()


func _on_Wereld_amountOfTrianglesChanged(newAmount, furthestZ, scored) -> void:
	maxZ = furthestZ
	
	if not scored:
		resetScale()


func _on_ScoreManager_scoreChanged(newScore, addedScore) -> void:
	
	var targetSize: Vector3 = scale * (addedScore * .2)
	
	animatingPuse = true
	animatePulse(scale, targetSize, true)

var animatingPuse = false	
	
func animatePulse(original: Vector3, target: Vector3, shouldReverse: bool):
	scale = lerp(scale, target, .15)	
	
	yield(get_tree(),"idle_frame")
	
	var dist: float = abs((scale - target).x)

	if dist > .1:
		animatePulse(original, target, shouldReverse)
		
	elif dist < .1:
		if shouldReverse == true:
			animatePulse(target, original, false)
		else:
			animatingPuse = false
			scale = target
			return
		
		
	
