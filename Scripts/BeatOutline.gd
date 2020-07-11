extends AnimatedSprite3D


export var speed: float = .5
export var maxScale: float = 1

var cScale: float = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	resetScale()
	
func resetScale():
	cScale = maxScale
	updateScale()
	pass


func updateScale():
	scale = Vector3(cScale, cScale, cScale)
	

func _process(delta):
	cScale -= speed * delta
	if (cScale <= 0):
		resetScale()
		
	updateScale()
