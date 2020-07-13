extends AnimatedSprite3D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true


func _process(delta: float) -> void:
	if Input.is_action_just_released("beatClick"):
		get_tree().paused = false
		visible = false
