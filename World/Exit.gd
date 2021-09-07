extends Area2D
#For Exit

export(PackedScene) var target_scene

func _ready():
	pass
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if !target_scene: # is null
			print("no scene in this door")
			return
		if get_overlapping_bodies().size() > 0:
#			print("exit")
			next_level()

func next_level():
	var ERR = get_tree().change_scene_to(target_scene)
	
	if ERR != OK:
		print("something failed")
