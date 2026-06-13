extends Area2D

var SPEED = 300
var direction = 1
var rng = RandomNumberGenerator.new()

@onready var spritePeixe = $SpritePeixe
@onready var colissionPeixe = $ColissionPeixe

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("peixes")
	var numeroPeixe = rng.randi_range(1,5)
	var caminhoTexturePeixe = "res://PeixesImages/Peixe" + str(numeroPeixe)+ ".png"
	spritePeixe.texture = load(caminhoTexturePeixe)
	DefinirColission()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	global_position.x += SPEED * direction * delta
	if direction < 0:
		spritePeixe.flip_h = false
	elif direction > 0:
		spritePeixe.flip_h = true
	
	
func DefinirColission():
	var shape = RectangleShape2D.new()
	var tamanho = spritePeixe.texture.get_size()
	shape.size = tamanho
	colissionPeixe.shape = shape
	
func _on_area_entered(area: Area2D) -> void:
	direction *= -1
