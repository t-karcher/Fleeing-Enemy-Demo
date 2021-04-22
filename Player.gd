extends KinematicBody2D

const MAX_SPEED = 400 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var mouse_pos := get_global_mouse_position()
	if position.distance_to(mouse_pos) < (MAX_SPEED * delta):
		move_and_collide(position.direction_to(get_global_mouse_position()))
	else:
		move_and_collide(position.direction_to(get_global_mouse_position()).normalized() * MAX_SPEED * delta)
