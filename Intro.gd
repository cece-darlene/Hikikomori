extends Node2D

func _ready():
	#Intro music starts playing here, at the beginning of the Intro
	MusicController.play_music()
	#This controls the timing for the Intro fading in, and at line 9 controls the timing for the 
	# fading out
	$AnimationPlayer.play("Fade in")
	yield(get_tree().create_timer(3), "timeout")
	$AnimationPlayer.play("Fade out")
	yield(get_tree().create_timer(1.5), "timeout")
	get_tree().change_scene("res://World/MainMenuFinal.tscn")
