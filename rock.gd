extends Area2D

var speed: float = 250.0
var target: Vector2
var velocity: Vector2

func _ready():
	var direction = (target - global_position).normalized()
	velocity = direction * speed
	
	rotation = velocity.angle() + PI / 2

func _process(delta):
	global_position += velocity * delta
