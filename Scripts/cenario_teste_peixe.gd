extends Node2D

var rng = RandomNumberGenerator.new()
var posUltimoSpawn


@export var camAnzol: Camera2D
@export var PeixeSpawnCowdown: Timer

func _ready() -> void:
	PeixeSpawnCowdown.start()
	posUltimoSpawn = camAnzol.global_position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	camAnzol.global_position.y += 20 * delta
	
func SpawnarPeixe(pos: Vector2):
	var peixe = preload("res://Scenes/peixe.tscn").instantiate()
	peixe.global_position = pos
	add_child(peixe)

func _on_peixe_spawn_cooldown_timeout() -> void:
	print("Spawnei")
	var tamanho_tela = get_viewport_rect().size/ camAnzol.zoom
	var limite_inferior = (camAnzol.global_position.y + tamanho_tela.y / 2)+10
	if(limite_inferior > posUltimoSpawn):
		var posX = rng.randi_range(20, 1000)
		var posSpawn = Vector2(posX,limite_inferior)
		SpawnarPeixe(posSpawn)
