extends Area2D

var invin = false setget set_invin
const HitEffect = preload("res://World/Effects/HitEffect.tscn")

onready var timer = $Timer

signal invin_started
signal invin_ended

func set_invin(value):
	invin = value
	if invin == true:
		#signalling out to other areas when these things happen
		emit_signal("invin_started")
	else:
		emit_signal("invin_ended")
		
#invincibility started with this function
func start_invin(duration):
	#sets invincible to true which then starts timer at the duration
	self.invin = true
	timer.start(duration)

#once timer is done it sets invincibility to false
func _on_Timer_timeout():
	self.invin = false

func _on_Hurtbox_invin_started():
	set_deferred("monitorable", false)

func _on_Hurtbox_invin_ended():
	monitorable = true


func _on_Hurtbox_area_entered(_area):
	var effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position 
