extends Node2D
#load scene
const KofuEffect = preload("res://World/Effects/KofuEffect.tscn")

#var collect = AudioStreamPlayer.new()
var stats = PlayerStats

func create_kofu_effect():
	#instance scene
	var kofuEffect = KofuEffect.instance()
	#add as a child
	get_parent().add_child(kofuEffect)
	#set position
	kofuEffect.global_position = global_position
	
# warning-ignore:unused_argument
func _on_Kofu_body_entered(_body):
	stats.health += 1
	GlobalWorld.score += 5	
#	print(stats.health)
	create_kofu_effect()
	queue_free()
	#	self.add_child(collect)
#	collect.stream = load("res://World/Sounds/ding.wav")
#	collect.play()


