extends Spatial

var gameScore: float
signal scoreChanged(newScore, addedScore)


func _on_ClickHandeler_beatReleaseSignal(value) -> void:
	
	var distance: int = get_parent().get_node("TriangleSpawner").getBeatOutlineDistanceFromClosestTriangle()
	
	var score: int = 3 - distance
	gameScore += score

	if score:
		emit_signal("scoreChanged", gameScore, score)
		pass
