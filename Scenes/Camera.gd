extends Camera


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

var positions = []
var target

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	positions = [get_parent().get_node("CP1"), get_parent().get_node("CP2"), get_parent().get_node("CP3"), get_parent().get_node("CP4")]
	target = positions[0]
	
func _process(delta: float) -> void:
	return
	translation = lerp(translation, target, .1)
	
	var dist = translation - target
	var sd = max(max(dist.x, dist.y), dist.z)
	
	if sd < .1:
			yield(get_tree().create_timer(randf() * 200),"timeout")
			target = positions[randi() % positions.size()]
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("wheel_down"):
		translation.z += min(1, translation.z)
		
	if Input.is_action_pressed("wheel_up"):
		translation.z -= 1
	
