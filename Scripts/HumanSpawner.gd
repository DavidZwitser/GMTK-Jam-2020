extends Path

export (PackedScene) var Human

var humans = []
var gaten = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var parent = get_parent().get_node("TriangleArt")
	gaten = [parent.get_node("HOLE1").translation, parent.get_node("HOLE2").translation, parent.get_node("HOLE3").translation]

func ChangeAmountOfHumans(amount):
	if (amount > len(humans)):
		for i in amount - len(humans):
			SpawnPeople()
	elif (amount < len(humans)):
		for i in len(humans) - amount:
			RemovePeople()




func SpawnPeople():
	var offset: float = randf() * 40

	$SpawnLocation.offset = offset
	
	var human = Human.instance()

	human.offsetPosition = offset
	add_child(human)
	
	print("spawning human")
	
	#human.rotation.z = $SpawnLocation.offset / 30.0 * PI * 2.0
	#print($SpawnLocation.offset)
	#print(round($SpawnLocation.offset / 10.0))
	#print(round($SpawnLocation.offset / 10.0) * PI * 2.0)
	human.translation = gaten[randi() % 3]
	human.translation.z += .1
	human.scale *= .05 + randf() * .1


func RemovePeople():
	if (len(humans) <= 0):
		return

	var removeHuman: AnimatedSprite3D = humans[len(humans)-1]
	humans.pop_back()
	remove_child(removeHuman)


func triangle_score_has_changed(newScore) -> void:
	print("score changed")
	var offset: int = floor(newScore * .5) - len(humans)
	
	if offset < 0:
		for i in range(abs(offset)):
			RemovePeople()
	
	elif offset > 0:
		for i in range(offset):
			SpawnPeople()
	pass # Replace with function body.
