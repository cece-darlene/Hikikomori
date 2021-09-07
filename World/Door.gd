extends Area2D

export(PackedScene) var target_scene

func _ready():
	pass
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if !target_scene: # is null
			print("no scene in this door")
			return
		if get_overlapping_bodies().size() > 0:
#			print("hello")
			$Complete.play()
			yield(get_tree().create_timer(2.0), "timeout")
			next_level()

func next_level():
#	queue_free()
	var ERR = get_tree().change_scene_to(target_scene)
		
	
	
	if ERR != OK:
		print("something failed")
