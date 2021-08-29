extends Node2D
#load scene
const KofuEffect = preload("res://World/Effects/KofuEffect.tscn")

var collect = AudioStreamPlayer.new()
var stats = PlayerStats

func create_kofu_effect():
	#instance scene
	var kofuEffect = KofuEffect.instance()
	#add as a child
	get_parent().add_child(kofuEffect)
	#set position
	kofuEffect.global_position = global_position
	
func _on_Kofu_body_entered(body):
	stats.health += 1
	GlobalWorld.score += 5	
#	print(stats.health)
	create_kofu_effect()
	self.add_child(collect)
	collect.stream = load("res://World/Sounds/ding.wav")
	collect.play()
	queue_free()

