extends CanvasLayer

onready var back = $VBoxContainer/Back

func _ready():
	back.grab_focus()
	
func _on_Exit_pressed():
	get_tree().change_scene("res://World/Screen/MainMenuFinal.tscn")
