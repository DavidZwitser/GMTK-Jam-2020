extends Path

export (PackedScene) var Human

var humans = []


# Called when the node enters the scene tree for the first time.
func _ready():
	ChangeAmountOfHumans(10)
	pass # Replace with function body.

func ChangeAmountOfHumans(amount):
	if (amount > len(humans)):
		for i in amount - len(humans):
			SpawnPeople()
	elif (amount < len(humans)):
		for i in len(humans) - amount:
			RemovePeople()
			
	
func SpawnPeople():
	$SpawnLocation.offset = randi()
	
	var human = Human.instance()
	add_child(human)
	
	human.rotation.z = $SpawnLocation.offset / 30.0 * PI * 2.0
	#print($SpawnLocation.offset)
	#print(round($SpawnLocation.offset / 10.0))
	#print(round($SpawnLocation.offset / 10.0) * PI * 2.0)
	human.translation = $SpawnLocation.translation
	human.translation.z += 10
	human.scale *= .3
	pass

func RemovePeople():
	var removeHuman: AnimatedSprite3D = humans[len(humans)-1]
	humans.pop_back()
	remove_child(removeHuman)

	
func Dance():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
