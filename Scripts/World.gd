extends Spatial

export var amountOfTriangels: int = 4
export (PackedScene) var Triangle
export var depthScale: int = 12

var time: float = 0
export var rotationSpeed: float = .05
export var rotationOffset: float = .05
export var rotationAmplitude: float = .1

var triangles = []

func _ready() -> void:

	for i in range(amountOfTriangels):
		var triangle: AnimatedSprite3D = Triangle.instance()
		
		var z: float = -i * depthScale
		triangle.translation.z = z
		
		triangles.append(triangle)
		add_child(triangle)
		
func _process(delta: float) -> void:	
	time += delta
	
	var index: int = len(triangles)
	
	for triangle in triangles:
		triangle.rotation.z = sin(time * rotationSpeed + index * rotationOffset) * rotationAmplitude
		
		index -= 1
