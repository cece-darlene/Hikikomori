extends CanvasLayer

var stats = PlayerStats
onready var start = $Buttons/Start

func _ready():
	#this will focus on the start button when the game loads up
		#the player can use the arrow buttons or 'WASD' to select each button
		#i use this grab focus on all of the screens
	start.grab_focus()
	
func _on_Start_pressed():
	GlobalWorld.score = 0
#	stats.health = 5
	get_tree().change_scene("res://World/Levels/Level_1.tscn")
#	MusicController.queue_free()
	#if nothing then dont do anything
	
func _on_Exit_pressed():
	get_tree().quit()


func _on_Hikikomori_pressed():
	get_tree().change_scene("res://World/Screen/AboutHikikomori.tscn")


func _on_HowTo_pressed():
	get_tree().change_scene("res://World/Screen/HowTo.tscn")
	


