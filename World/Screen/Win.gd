extends CanvasLayer

onready var exit = $VBoxContainer/Exit

func _ready():
	exit.grab_focus()
	
func _on_Exit_pressed():
	get_tree().quit()


func _on_MM_pressed():
	get_tree().change_scene("res://World/Screen/MainMenuFinal.tscn")


