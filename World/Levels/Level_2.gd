extends Node2D

export(int) var initial_score = 0
#var stats = PlayerStats
onready var score = initial_score setget set_score

func set_score(value):
	score = value
#	print (score)

