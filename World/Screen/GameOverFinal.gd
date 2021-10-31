extends CanvasLayer

onready var try = $VBoxContainer/TryAgain

func _ready():
	try.grab_focus()
	
func _on_Exit_pressed():
	get_tree().quit()


func _on_MM_pressed():
	get_tree().change_scene("res://World/Screen/MainMenuFinal.tscn")


func _on_TryAgain_pressed():
	get_tree().change_scene("res://World/Screen/MainMenuFinal.tscn")
