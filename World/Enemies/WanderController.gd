extends Node2D

export (int) var wander_range = 15

onready var start_position = global_position
onready var target_position = global_position

onready var timer = $Timer

func update_target_position():
# warning-ignore:unused_variable
	var target_vector = Vector2(rand_range(-wander_range, wander_range), rand_range(-wander_range, wander_range))
	target_position = start_position + target_position
	
func get_time_left():
	return timer.time_left
	
func start_wander_timer(duration):
	timer.start(duration)

func on_Timer_timeout():
	update_target_position()
