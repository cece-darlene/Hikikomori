extends CanvasLayer

onready var back = $HBoxContainer/Back
func _ready():
	back.grab_focus()

func _on_Back_pressed():
	get_tree().change_scene("res://World/Screen/MainMenuFinal.tscn")
	
