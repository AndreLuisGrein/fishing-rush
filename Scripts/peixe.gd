extends Area2D

var SPEED = 300
var direction = -1
var rng = RandomNumberGenerator.new()
var fisgado = false

@onready var spritePeixe = $SpritePeixe
@onready var colissionPeixe = $ColissionPeixe
@onready var colissionBoca = $BocaPeixe/ColissionBoca
@onready var BocaPeixe = $BocaPeixe

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("peixes")
	var numeroPeixe = rng.randi_range(1,5)
	var caminhoTexturePeixe = "res://PeixesImages/Peixe" + str(numeroPeixe)+ ".png"
	spritePeixe.texture = load(caminhoTexturePeixe)
	DefinirColission()
	DefinirColissionBoca()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if (fisgado):
		if direction == 1:
			set_rotation_degrees(270)
		else:
			set_rotation_degrees(90)
		global_position = get_global_mouse_position()


	else:
		global_position.x += SPEED * direction * delta
		
	
	
func DefinirColission():
	var shape = RectangleShape2D.new()
	var tamanho = spritePeixe.texture.get_size()
	shape.size = tamanho
	colissionPeixe.shape = shape
	
func DefinirColissionBoca():
	var shape = CircleShape2D.new()
	shape.radius = 2
	colissionBoca.shape = shape
	
	
#corpo
func _on_area_entered(area: Area2D) -> void:
	if(area.is_in_group("parede")):
		direction *= -1
		scale.x = -direction
	
#boca
func _on_boca_peixe_area_entered(area: Area2D):
	if area.is_in_group("anzol"):
		fisgado = true
		
