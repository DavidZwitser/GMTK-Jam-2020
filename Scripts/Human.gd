extends AnimatedSprite3D

var targetLocation: Vector3
var offsetPosition: float

var mensjesColors = ["#4E1754", "#175438", "#405019", "#733A13", "#182B53"]
var myColor

func _ready() -> void:

	frame = floor(randf() * 6)
	
	myColor = Color(mensjesColors[randi() % mensjesColors.size()])
	#myColor.a = 10
	print(myColor)
	modulate = myColor
	
	yield(get_tree().create_timer(randf() * .2), "timeout")
	play()
	
	resetTarget()
	
	

func resetTarget():
	var spawnLocation = get_parent().get_node("SpawnLocation")
	spawnLocation.offset = offsetPosition + randf() * 6

	targetLocation = spawnLocation.translation + Vector3((randf() - .5) * 2, (randf() - .5) * 2, 0)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	translation = lerp(translation, targetLocation, .0024)
	
	var distance = translation - targetLocation
	var furthestDistance: int = max(max(distance.x, distance.y), distance.z)
	
	if (furthestDistance < .1):
		resetTarget()
	
	var newScale = (abs(translation.x) + abs(translation.y)) * .03
	var newColor = newScale * 7
	modulate = myColor * newColor
	scale = Vector3(newScale, newScale, 0)
