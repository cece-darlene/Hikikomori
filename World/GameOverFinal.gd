extends CanvasLayer


func _ready():
	pass 

func _on_Exit_pressed():
	get_tree().quit()


func _on_MM_pressed():
	get_tree().change_scene("res://World/MainMenuFinal.tscn")


func _on_TryAgain_pressed():
	get_tree().change_scene("res://World/MainMenuFinal.tscn")
