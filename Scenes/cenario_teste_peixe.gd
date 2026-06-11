extends Node2D

var rng = RandomNumberGenerator.new()


@onready var camAnzol = $AnzolFake/Camera2D
@onready var PeixeSpawnCowdown = $Timer

func _ready() -> void:
	PeixeSpawnCowdown.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	print("spawnei")
	var tamanho_tela = get_viewport_rect().size
	var limite_inferior = camAnzol.global_position.y + tamanho_tela.y / 2
	var peixe = preload("res://Scenes/peixe.tscn").instantiate()
	var posSpawn = Vector2(camAnzol.global_position.x,limite_inferior+10)
	peixe.global_position = posSpawn
	add_child(peixe)
