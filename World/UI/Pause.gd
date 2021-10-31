extends CanvasLayer

onready var contin = $VBoxContainer/Continue

func _ready():
	set_visible(false)

	
func _input(event):
	if event.is_action_pressed("ui_cancel"): #escape button by default
		contin.grab_focus() #focuses on the continue button when the player presses 'P' or esc
		set_visible(!get_tree().paused) #if not pause then hide
		get_tree().paused = !get_tree().paused #toggle pause status


func _on_Continue_pressed():
	get_tree().paused = false
	set_visible(false)
	
func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible

func _on_Fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen


func _on_MM_pressed():
	get_tree().change_scene("res://World/Screen/MainMenuFinal.tscn")
	GlobalWorld.score = 0
	get_tree().paused = false
	set_visible(false)

func _on_Exit_pressed():
	get_tree().quit()
	
