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
		addTriangle()	
		
func _process(delta: float) -> void:	
	time += delta
	
	var index: int = len(triangles)
	
	for triangle in triangles:
		triangle.rotation.z = sin(time * rotationSpeed + index * rotationOffset) * rotationAmplitude
		
		index -= 1
		
	_on_ClickHandeler_beatReleaseSignal(0)

func addTriangle():
	var triangle: Spatial = Triangle.instance()
		
	var z: float = -len(triangles) * depthScale
	triangle.translation.z = -z * z
	
	
	triangles.append(triangle)
	add_child(triangle)
	
func getRotationFromZ(z: float) -> float:

	var closestTriangle: Spatial = triangles[0]
	
	for triangle in triangles:
		if triangle.translation.z < z:
			return triangle.rotation.z
			
	return .0


func removeTriangle():
	var triangleToRemove: Spatial = triangles[len(triangles)-1]
	
	triangles.pop_back()
	
	remove_child(triangleToRemove)

func _on_ClickHandeler_beatReleaseSignal(value) -> void:
	var beatOutlineZ = get_node("BeatOutline").translation.z
	
	var distance: int = 999999999999999999999
	var closestIndex: int = 1
	
	for i in range(len(triangles)):
		
		if abs(triangles[i].translation.z - beatOutlineZ) < distance:
			closestIndex = i
			distance = abs(triangles[i].translation .z - beatOutlineZ)

	var score = distance / max(closestIndex, 1)
	
	#print(score)
