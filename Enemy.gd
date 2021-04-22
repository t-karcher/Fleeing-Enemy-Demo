extends Area2D

const MAX_SPEED = 350
const CENTER = Vector2(450,300)

enum {FLEEING, ROAMING}
var state = ROAMING
var body_to_flee_from : KinematicBody2D
var random_target_pos : Vector2 = Vector2(450,300)

func _process(delta):
	match state:
		FLEEING:
			position -= position.direction_to(body_to_flee_from.position) * MAX_SPEED * delta
		ROAMING:
			if position.distance_to(random_target_pos) <= MAX_SPEED * delta:
				random_target_pos = CENTER + Vector2(0,300).rotated(randf() * 2 * PI)
			else:
				position += position.direction_to(random_target_pos) * MAX_SPEED * delta
			
func _on_Enemy_body_entered(body):
	state = FLEEING
	body_to_flee_from = body

func _on_Enemy_body_exited(body):
	state = ROAMING
	random_target_pos = position
