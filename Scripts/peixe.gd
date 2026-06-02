extends RigidBody2D

var SPEED = 300
var direction = 1
var rng = RandomNumberGenerator.new()

@onready var spritePeixe = $SpritePeixe

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var numeroPeixe = rng.randi_range(1,5)
	var caminhoTexturePeixe = "res://PeixesImages/Peixe" + str(numeroPeixe)+ ".png"
	spritePeixe.texture = load(caminhoTexturePeixe)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	linear_velocity = Vector2(SPEED * direction, linear_velocity.y)
