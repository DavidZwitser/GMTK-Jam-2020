extends Spatial

signal amountOfTrianglesChanged(newAmount, furthestZ, scored)
signal scoreChanged(newScore)

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
		
	#_on_ClickHandeler_beatReleaseSignal(0)

func addTriangle():
	var triangle: Spatial = Triangle.instance()
		
	var z: float = -len(triangles) * depthScale
	triangle.translation.z = -z * z
	
	
	triangles.append(triangle)
	add_child(triangle)
	
	emit_signal("amountOfTrianglesChanged", len(triangles), triangles[len(triangles) - 1].translation.z, true)
	


func removeTriangle():
	if (len(triangles) == 1):
		return
		
	var triangleToRemove: Spatial = triangles[len(triangles)-1]
	
	triangles.pop_back()
	
	remove_child(triangleToRemove)
	
	emit_signal("amountOfTrianglesChanged", len(triangles), triangles[len(triangles) - 1].translation.z, false)

func getRotationFromZ(z: float) -> float:

	var closestTriangle: Spatial = triangles[0]
	
	for triangle in triangles:
		if triangle.translation.z < z:
			return triangle.rotation.z
	
	return .0

func getBeatOutlineDistanceFromClosestTriangle():
	var distance: int = 999999999999999999999
	var closestIndex: int = 1
	
	var beatOutlineZ = get_node("BeatOutline").translation.z
	
	for i in range(len(triangles)):
		
		if abs(triangles[i].translation.z - beatOutlineZ) < distance:
			closestIndex = i
			distance = abs(triangles[i].translation.z - beatOutlineZ)
			
	return 	distance / max(closestIndex, 1)
 

func _on_ScoreManager_scoreChanged(newScore: float) -> void:
	#print(newScore, "poep")
	var offset: int = len(triangles) - newScore
	
	print(len(triangles), offset, "offset")
	
	if offset < 0:
		for i in range(abs(offset)):
			removeTriangle()
	
	elif offset > 0:
		for i in range(offset):
			addTriangle()
