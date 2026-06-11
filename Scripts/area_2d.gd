extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("peixes"):
		body.direction *= -1
