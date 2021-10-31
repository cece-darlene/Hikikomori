extends Control

#Below is the text for the beginning of the game. The text in the code so i am able to change the code whenever
	#I wont lose the text if i code it this way. Compared with the manual text input on the text label
var dialogue = [
	'My name is Hiko Tamika and for the last 5 years I have been suffering in my room, isolated from the world. ',
	'I have lost all my friends and my family are ashamed of me.',
	'I want to leave, I want to get better ... ',
	'Every time I try, I fail.',
	'But now I have hope ...',
	'I have hope that you can help me get out of this.',
	'I need your help ...',
]
var dialogue_index = 0
#the text has not finished playing
var finished = false

func _ready():
	#when the game starts load the dialogue. this will happen after the bootsplash loads
	load_dialogue()

func _process(delta):
	#below is just the indicator for the player to press a button to go to the next bit of dialogue
		#and whether the indicator is visible 
	$"indicator".visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialogue()
	
func load_dialogue():
	#below controls the style of the dialogue and what to do next when all of the dialogue had been read.
	if dialogue_index < dialogue.size():
		finished = false
		#using bbcode as I am able to add styles or effects to the text
		$RichTextLabel.bbcode_text = dialogue[dialogue_index]
		$RichTextLabel.percent_visible = 0
		#This is the tween which i was learning about. This makes the text animate like it is typing
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		#once the dialogue has completed it is cleared and then the scene changes to the main menu
		queue_free()
		get_tree().change_scene("res://World/Screen/MainMenuFinal.tscn")
	dialogue_index += 1


func _on_Tween_tween_completed(object, key):
	finished = true
