extends Area2D

var speed = 100

func _ready() -> void:
	add_to_group("anzol")

func _process(delta: float) -> void:
	
	global_position = get_global_mouse_position()
	
