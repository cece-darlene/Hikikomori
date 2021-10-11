extends KinematicBody2D

const EnemyDeathEffect = preload("res://World/Effects/EnemyDeathEffect.tscn")


export var ACCELERATION = 50
export var MAX_SPEED = 60
export var FRICTION = 100


enum{
	IDLE,
	WANDER,
	CHASE
}

var velocity = Vector2.ZERO
var knockback = Vector2.ZERO 

var state = CHASE

onready var sprite = $AnimatedSprite
onready var stats = $Stats
onready var playerDetectionZone = $PlayerDetectionZone
onready var softCollision = $SoftCollsion
onready var wanderController = $WanderController

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 50 * delta)
	knockback = move_and_slide(knockback)
	
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, 200 * delta)
			seek_player()
			
			if wanderController.get_time_left() == 0:
				state = pick_random_state([IDLE, WANDER])
				wanderController.start_wander_timer(rand_range(1, 3))
		WANDER:
			seek_player()
			if wanderController.get_time_left() == 0:
				state = pick_random_state([IDLE, WANDER])
				wanderController.start_wander_timer(rand_range(1, 3))
			
			var direction = global_position.direction_to(wanderController.target_position)
			velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
				
			if global_position.distance_to(wanderController.target_position) <= 4:
				state = pick_random_state([IDLE, WANDER])
				wanderController.start_wander_timer(rand_range(1, 3))
		CHASE:
			var player = playerDetectionZone.player
			if player != null:
				var direction = global_position.direction_to(player.global_position)
				velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
			else:
				state = IDLE
			sprite.flip_h = velocity.x < 0
			
	if softCollision.is_colliding():
		velocity += softCollision.get_push_vector() * delta * 400
	velocity = move_and_slide(velocity)
	
func seek_player():
	if playerDetectionZone.can_see_player():
		state = CHASE
		
func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()
	
func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
#	print(stats.health)
	knockback = area.knockback_vector * 125

#The function below checks if the enemy has no health and if it doesn't then it begins the function otherwise it will not begin
func _on_Stats_no_health():
	#10 points are added each time the player kills an enemy
	GlobalWorld.score += 10 
	#the enemy death effect variable, then it adds an instance of the enemy death effect
	var enemyDeathEffect = EnemyDeathEffect.instance()
	#it then plays the death effect when the enemy dies
	get_parent().add_child(enemyDeathEffect)
	enemyDeathEffect.global_position = global_position
	queue_free()
