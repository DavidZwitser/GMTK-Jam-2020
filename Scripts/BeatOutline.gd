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

	if translation.z < maxZ:
		resetScale()


func _on_Wereld_amountOfTrianglesChanged(newAmount, furthestZ, scored) -> void:
	maxZ = furthestZ
	
	if not scored:
		resetScale()
