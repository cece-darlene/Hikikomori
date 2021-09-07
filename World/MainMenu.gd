extends MarginContainer

const start_scene = preload("res://World/World.tscn")
var score = 0
onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer4/VBoxContainer/CenterContainer/HBoxContainer/Selector

var current_selection = 0

func _ready():
	set_current_selection(0)
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 1:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)	
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)
		
# warning-ignore:shadowed_variable
func handle_selection(current_selection):
	if current_selection == 0:
		get_parent().add_child(start_scene.instance())
#		score = 0
		queue_free()
#		get_tree().reload_current_scene()
	elif current_selection == 1:
		get_tree().quit()
		
func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	if _current_selection == 0:
		selector_one.text = ">"
	elif _current_selection == 1:
		selector_two.text = ">"
