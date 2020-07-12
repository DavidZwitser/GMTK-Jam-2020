extends AnimatedSprite3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func ChangeAnimation():
	var types = frames.get_animation_names()
	animation = types[randi() % types.size()]
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
