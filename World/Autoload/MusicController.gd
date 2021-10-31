extends Node

#Loads the imported music
var introMusic = load("res://World/Sounds/mp3-now.com - Rain  8bit Relaxing Music.mp3")

func _ready():
	pass

#This is just a function to play the music however it does not start playing the music yet	
func play_music():
	$Music.stream = introMusic
	$Music.play()
	
	
