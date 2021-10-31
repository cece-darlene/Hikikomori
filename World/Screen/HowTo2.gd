extends CanvasLayer

onready var next = $HBoxContainer/Next
func _ready():
	next.grab_focus()

func _on_Back_pressed():
	get_tree().change_scene("res://World/Screen/HowTo.tscn")

func _on_Next_pressed():
	get_tree().change_scene("res://World/Screen/HowTo3.tscn")
	
