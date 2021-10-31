extends KinematicBody2D
#acceleration constant so character does not immediately move to the right
export var ACCELERATION = 500
export var MAX_SPEED = 100
export var FRICTION = 500
#vector is an x and y position, so position.x would be a vector
#velocity is change of current position
#acceleration is the change in velocity over time
#friction is change of velocity over time

enum {
	MOVE,
	ATTACK
}
var state = MOVE
var velocity = Vector2.ZERO
var stats = PlayerStats
#getting access to the node

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback") 
onready var punchHitbox = $HitboxPivot/PunchHtbox
onready var hurtbox = $Hurtbox
onready var blinkAnimationPlayer = $BlinkAnimationPlayer

func _ready():
	#the health will always restart to 5 if the player dies or restarts the game
	stats.health = 5
	#will always check if the player has no health, if they have no health a signal
		#is sent and the player will be lead to the gameover screen
	stats.connect("no_health", self, "gameover")	
	animationTree.active = true

func _process(delta):
	#the below code will ensure that the player can only do one thing at a time
		#they cannot move and attack at the same time
	match state:
		MOVE:
			move_state(delta)
			
		ATTACK:
			attack_state(delta)
	
func move_state(delta):
	#below is the movement of the character when the player presses 'WASD'
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	#the normalized input_vector will ensure that when the player moves diagonal it is the same speed as going right/left/up/down
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		punchHitbox.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)		
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)			
	else:
		animationState.travel("Idle")
		#move_toward is used to apply friction
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	#delta = real world time. When you have something that changes over time, if its connected to the frame rate you need to multiply by delta
	velocity = move_and_slide(velocity)
	
	if Input.is_action_just_pressed("attack"):
#can use the next line of code for store/buying hearts
#		PlayerStats.max_health += 1
		state = ATTACK
	
func attack_state(_delta):
#	velocity = Vector2.ZERO
	animationState.travel("Attack")

func attack_animation_finished():
	state = MOVE

func _on_Hurtbox_area_entered(_area):
	stats.health -= 1
	hurtbox.start_invin(0.5)
	#hit effect? 
#	print(stats.health)

 

func gameover():
#	print("play animation")
	queue_free()
	get_tree().change_scene("res://World/Screen/GameOverFinal.tscn")
	
	
#func reset():
#	World.score = 0
#	stats.health = 5
