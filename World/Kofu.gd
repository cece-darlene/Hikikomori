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

#This function is to add an extra health to the player everytime 
# the kofu (the happiness item) is being collected by the player
#Underneath is also a signal that connects the body being entered on
# the Kofu to the script
func _on_Kofu_body_entered(_body):
	#Adds 1 heart to the player
	stats.health += 1 
	#AND also adds 5 to the global score
	GlobalWorld.score += 5	
	#The collect effect for the kofu will play when it is collected
	create_kofu_effect()
	#The Kofu will the disappear at the end
	queue_free()
	
	#	self.add_child(collect)
#	collect.stream = load("res://World/Sounds/ding.wav")
#	collect.play()


