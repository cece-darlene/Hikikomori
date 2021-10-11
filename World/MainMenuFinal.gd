extends CanvasLayer

var stats = PlayerStats

func _ready():
	pass 

func _on_Start_pressed():
#	World.score = 0
#	stats.health = 5
	get_tree().change_scene("res://World/World.tscn")
	MusicController.queue_free()

func _on_Exit_pressed():
	get_tree().quit()
