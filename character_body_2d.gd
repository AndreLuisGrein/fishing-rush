extends CharacterBody2D

var max_velocity = 1000
var speed = 100


func _physics_process(delta: float) -> void:

	if global_position.y < max_velocity:
		velocity.y += speed * delta
	else:
		pass
	var mouse_position_x = get_global_mouse_position().x
	if mouse_position_x > global_position.x:
		velocity.x += speed * 0.1  + delta
	elif mouse_position_x < global_position.x:
		velocity.x -=  speed * 0.1 + delta
	else:
		pass
	move_and_slide()
