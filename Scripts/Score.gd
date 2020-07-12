extends Label


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Wereld_amountOfTrianglesChanged(newAmount, furthestZ, scored) -> void:
	pass

func _on_ClickHandeler_beatReleaseSignal(value) -> void:
	pass # Replace with function body.


func _on_ScoreManager_scoreChanged(newScore) -> void:
	text = str(newScore)
	pass # Replace with function body.
