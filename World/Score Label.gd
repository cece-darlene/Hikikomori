extends Label

func _process(delta):
	text = "Score: " + String(GlobalWorld.score)
